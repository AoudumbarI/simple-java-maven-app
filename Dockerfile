FROM tomcat:8
CMD ["catalina.sh","run"]
LABEL app=techverito
COPY target/*.jar /usr/local/tomcat/webapps/my-app-1.0-SNAPSHOT.jar

