# Gradle Conventions

Conventional Gradle plugins. The ones named with `bundle` are intended to each fulfill a general use case and the others are smaller features that make up those use cases.

See documentation [in the code](/src/main/groovy) and also [running examples](/examples).

Release with `./gradlew updateVersion && ./gradlew release`.

## Libraries and applications

The `se.fk.gradle.bundle-jar` is intended to fulfill most use cases. It might be a library or an application.

See example in [template-jar](https://github.com/Forsakringskassan/template-jar).

## OpenAPI API

- `se.fk.gradle.bundle-openapi` - Applied in root for API repositories, to prodouce a JAR containing the specification.

See example in [template-api](https://github.com/Forsakringskassan/template-api).

## OpenAPI code generation

- `se.fk.gradle.openapi-generate` - Can be applied whenever you need code generated from a JAR produced by `se.fk.gradle.bundle-openapi`.

See example in [template-jar-api-generate](https://github.com/Forsakringskassan/template-jar-api-generate)

## Requirements

Gradle wrapper can be downloaded with:

```sh
GRADLE_VERSION=8.14.3

cat > gradle/wrapper/gradle-wrapper.properties << EOL
distributionBase=GRADLE_USER_HOME
distributionPath=wrapper/dists
distributionUrl=https\://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip
networkTimeout=10000
zipStoreBase=GRADLE_USER_HOME
zipStorePath=wrapper/dists
EOL

./gradlew wrapper \
  --gradle-version="${GRADLE_VERSION}" \
  --distribution-type=bin
```
