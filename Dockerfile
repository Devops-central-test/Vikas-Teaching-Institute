FROM tomcat:9-jdk17

# Remove default apps
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy WAR from Maven target directory
COPY target/admin-devops-app.war /usr/local/tomcat/webapps/admin-devops-app.war

EXPOSE 8080

CMD ["catalina.sh", "run"]
