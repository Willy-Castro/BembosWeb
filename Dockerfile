# Etapa 1: Compilar con Ant
FROM openjdk:8-jdk AS build
WORKDIR /app

# Copiamos todo el proyecto al contenedor
COPY . .

# Instalamos Ant y construimos el .war
RUN apt-get update && apt-get install -y ant \
    && ant clean dist

# Etapa 2: Tomcat para ejecutar la app
FROM tomcat:9.0-jdk8

# Eliminamos las apps de ejemplo de Tomcat
RUN rm -rf /usr/local/tomcat/webapps/*

# Copiamos el WAR generado por Ant y lo desplegamos como ROOT
COPY --from=build /app/dist/BembosWeb.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080
CMD ["catalina.sh", "run"]