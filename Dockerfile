# Etapa 1: Build con Ant
FROM openjdk:8-jdk AS build
WORKDIR /app

# Copiamos el proyecto
COPY . .

# Instalamos Ant
RUN apt-get update && apt-get install -y ant \
    && ant clean dist

# Etapa 2: Payara (sucesor de GlassFish)
FROM payara/server-full:5.2021.10

# Copiamos el WAR generado a Payara
COPY --from=build /app/dist/BembosWeb.war $DEPLOY_DIR

EXPOSE 8080