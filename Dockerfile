# Etapa 1: Compilar con Ant
FROM openjdk:8-jdk AS build
WORKDIR /app

COPY . .

RUN apt-get update && apt-get install -y ant \
    && ant clean dist

# Etapa 2: Tomcat para ejecutar la app
FROM tomcat:9.0-jdk8

RUN rm -rf /usr/local/tomcat/webapps/*

COPY --from=build /app/dist/BembosWeb.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080
CMD ["catalina.sh", "run"]