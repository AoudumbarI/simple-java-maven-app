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
     sh "sudo docker build -t aoudumbar/tech-app1:3.0.0 ."
    }
  }
  stage('Push Docker Image'){
    steps{
      sh "sudo docker login -u aoudumbar24 -p qwer@1234"
      sh "sudo docker tag aoudumbar/tech-app:2.0.0 aoudumbar24/tech:v4"
      sh "sudo docker push aoudumbar24/tech:v4"
       }
     }
  stage('Run Container on Dev Server'){
    steps{
     sshagent(['avcs']) {
      sh "ssh -o StrictHostKeyChecking=no ec2-user@65.0.179.45"
      sh "sudo docker run -p 8080:8080 -d --name myapp aoudumbar24/tech:v4"
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
