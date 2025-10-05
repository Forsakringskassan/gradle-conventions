#!/bin/bash
set -e

scriptdir=$(pwd)

rm -rf bin
rm -rf ~/.m2/repository/se/bjurr/gradle
find . -name build | xargs rm -rf

./gradlew build publishToMavenLocal -Pversion=latest-SNAPSHOT

subprojects=(
"jar|./gradlew build publishToMavenLocal -Pversion=latest-SNAPSHOT -s"
"multiproject|./gradlew build publishToMavenLocal -Pversion=latest-SNAPSHOT -s"
"openapi|./gradlew build publishToMavenLocal -Pversion=latest-SNAPSHOT -s"
"openapi-generate|./gradlew build publishToMavenLocal -Pversion=latest-SNAPSHOT -s"
)

run_subproject() {
    local name="$1"
    local cmds="$2"
    local testitem="examples/$name"

    echo
    echo "|"
    echo "| Testing $testitem"
    echo "|"

    pushd "$testitem" >/dev/null

    cp -r "$scriptdir/gradle" .
    cp "$scriptdir/gradlew" .
    cp "$scriptdir/gradlew.bat" .

    while IFS= read -r c || [ -n "$c" ]; do
        c=$(echo "$c" | xargs)
        if [ -n "$c" ]; then
            echo "| Running: $c"
            bash -c "$c"
            echo
        fi
    done <<< "$cmds"

    popd >/dev/null
}

for entry in "${subprojects[@]}"; do
    IFS="|" read -r sub cmd <<< "$entry"
    run_subproject "$sub" "$cmd"
done

echo -e "File\tSize"
while IFS= read -r jar; do
    size=$(stat -c "%s" "$jar" 2>/dev/null || stat -f "%z" "$jar")
    hr_size=$(numfmt --to=iec-i --suffix=B "$size")
    echo -e "$jar\t$hr_size"
done < <(find . -type f -name "*.jar") | column -t -s $'\t'

echo "OK"
echo
