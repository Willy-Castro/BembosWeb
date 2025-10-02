FROM payara/server-full:5.2021.10

COPY dist/BembosWeb.war $DEPLOY_DIR

EXPOSE 8080