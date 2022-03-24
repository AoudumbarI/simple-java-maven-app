
FROM tomcat:8
LABEL app=my-app
COPY /var/lib/jenkins/workspace/MyappPipeline/target/my-app-1.0-SNAPSHOT.jar /usr/local/tomcat/webapps/myweb.war
