FROM tomcat:8
LABEL app=TechVerto
COPY target/*.jar /usr/local/tomcat/webapps/TechVerto.jar

