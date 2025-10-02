# Etapa 1: Build con Ant
FROM openjdk:8-jdk as build
WORKDIR /app

# Copiamos todo el proyecto
COPY . .

# Ejecutamos el build de Ant
RUN apt-get update && apt-get install -y ant && \
    ant clean && ant

# Etapa 2: Tomcat para desplegar
FROM tomcat:9.0-jdk8
# Eliminamos apps por defecto de Tomcat
RUN rm -rf /usr/local/tomcat/webapps/*

# Copiamos el WAR generado en build/ a Tomcat
COPY --from=build /app/dist/BembosWeb.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080
CMD ["catalina.sh", "run"]