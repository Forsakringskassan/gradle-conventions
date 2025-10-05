# Gradle Conventions

Conventional Gradle plugins. The ones named with `bundle` are intended to each fulfill a general use case and the others are smaller features that make up those use cases.

See documentation [in the code](/src/main/groovy) and also [running examples](/examples).

Release with `./gradlew updateVersion && ./gradlew release`.

Use these plugins like this:

```groovy
buildscript {
  repositories {
    gradlePluginPortal()
    mavenCentral()
    mavenLocal()
    maven {
      url = uri("https://maven.pkg.github.com/Forsakringskassan/gradle-conventions")
      credentials {
        username = System.getenv("GITHUB_ACTOR")
        password = System.getenv("GITHUB_TOKEN")
      }
    }
  }

  dependencies {
    classpath "se.fk.gradle:gradle-conventions:X"
  }
}

apply plugin: "se.fk.gradle.[name-of-plugin]"
```

## Setup

This library is published here on GitHub. To use it you need credentials setup.

- Go to <https://github.com/settings/tokens>
- You only need `read:packages`
- Add the credentials as environment variables, perhaps in `~/.bashrc`:
  - `export GITHUB_TOKEN=the-token`
  - `export GITHUB_ACTOR=your-github-user`

## `se.fk.gradle.bundle-jar` - Libraries and applications

The `se.fk.gradle.bundle-jar` is intended to fulfill most use cases. It might be a library or an application.

See example in [template-jar](https://github.com/Forsakringskassan/template-jar).

## OpenAPI API

- `se.fk.gradle.bundle-openapi` - Applied in root for API repositories, to prodouce a JAR containing the specification.

See example in [template-api](https://github.com/Forsakringskassan/template-api).

## OpenAPI code generation

- `se.fk.gradle.openapi-generate` - Can be applied whenever you need code generated from a JAR produced by `se.fk.gradle.bundle-openapi`.

See example in [template-jar-api-generate](https://github.com/Forsakringskassan/template-jar-api-generate)

