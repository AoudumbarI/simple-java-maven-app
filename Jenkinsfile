pipeline {
  agent any
  
  tools { 
    maven "Maven-4"
  }
   
  stages {
     stage ("Build"){
       steps {
       sh "mvn -version"
       sh "mvn clean install"
       }
     }
  stage('Build Docker Image'){
    steps{
     sh "sudo docker build -t aoudumbar/tech-app:3.0.0 ."
    }
  }
  stage('Push Docker Image'){
    steps{
      sh "sudo docker login -u aoudumbar24 -p qwer@1234"
      sh "sudo docker tag aoudumbar/tech-app:2.0.0 aoudumbar24/tech:v3"
      sh "sudo docker push aoudumbar24/tech:v3"
       }
     }
  stage('Run Container on Dev Server'){
    steps{
     sshagent(['avcs']) {
      sh "ssh -o StrictHostKeyChecking=no ec2-user@13.233.154.15"
      sh "sudo docker run -p 8080:8080 -d --name tech-app aoudumbar24/tech:v3"
       }
     }
   }
 }
 post {
    always {
     cleanWs()
    }
  }
}