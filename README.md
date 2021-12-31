# docker-springboot-base

Image de base pour les applications Spring Boot.

Fonctionnalités:
- désactivation de la bannière Spring Boot
- utilisateur par défaut `app:app`
- droits de`${WORKDSPACE}` ou `/opt/app` en u+rx, g+rx
- auto discovery des secrets dans `/run/secrets` et accessibles en tant que variables d'environnement
- configuration des options de la jvm via la variable d'environnement `JAVA_OPTS`
- ONBUILD copie de `/usr/src/app/target/*.jar` du stage `builder` vers `${WORKSPACE}/app.jar

# Getting started

## Multi-stage build

- Nommer la première couche `builder`
- Placer le `jar` à `${WORKSPACE}/app.jar`, par défaut `/opt/app`, soit `/opt/app/app.jar`
- Dans la couche finale, partir de `govpf/springboot-base:17-jre`

## Exemple d'utilisation dans un dockerfile

```
FROM govpf/maven:3-jdk-17 as builder
WORKDIR /usr/src/app
COPY . .
RUN mvn package -DskipTests

FROM govpf/docker-springboot-base:17-jre
```

# Définition des fichiers normatifs par défaut

| Nom du fichier     | A quoi sert ce fichier ?                                                                                          |
| ------------------ | ----------------------------------------------------------------------------------------------------------------- |
| CODE_OF_CONDUCT.md | Ce fichier définit des normes d'engagement dans la communauté.                                                    |
| CONTRIBUTING.md    | Ce fichier indique comment vous pouvez contribuer.                                                                |
| SECURITY.md        | Ce fichier donne des instructions sur la façon de signaler de manière responsable une vulnérabilité de sécurité.  |
| SUPPORT.md         | Ce fichier permet aux contributeurs de savoir comment obtenir de l'aide.                                          |


