# Imagen base con Java (Payara Micro necesita Java 11+)
FROM openjdk:11-jdk

# Descargamos Payara Micro
ADD https://repo1.maven.org/maven2/fish/payara/distributions/payara-micro/5.2021.10/payara-micro-5.2021.10.jar /opt/payara-micro.jar

# Copiamos tu aplicación compilada (WAR)
COPY build/BembosWeb.war /opt/BembosWeb.war

# Exponemos el puerto de Payara (Render usará el 8080)
EXPOSE 8080

# Comando para ejecutar el servidor
CMD ["java", "-jar", "/opt/payara-micro.jar", "--deploy", "/opt/BembosWeb.war", "--port", "8080"]
