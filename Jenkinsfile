pipeline {

  environment {
    dockerimagename = "cyberbrace/bmi-server-skp"
    dockerImage = ""
  }

  agent any

  stages {
      stage('Checkout Source') {
      steps {
         git branch: 'main', credentialsId: 'keloyeleye-git', url: 'https://github.com/keloyeleye/bmi-backend.git'
      }
    }
    stage('Build image') {
      steps{
        script {
          dockerImage = docker.build dockerimagename
        }
      }
    }

    stage('Pushing Image') {
      environment {
               registryCredential = 'dockerhublogin'
           }
      steps{
        script {
          docker.withRegistry( 'https://registry.hub.docker.com', registryCredential ) {
            dockerImage.push("latest")
          }
        }
      }
    }

  }

}
