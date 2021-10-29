pipeline {
  environment {
    registry = "tle249/jenkin1"
    registryCredential = ‘dockerhub-jenkinfile-credentials’
  }
  agent any
  stages {
    stage('Cloning Git') {
      steps {
        git 'https://github.com/thienle3005/demo-jenkin-docker-maven.git'
      }
    }
    stage('Building image') {
      steps{
        script {
          docker.build registry + ":$BUILD_NUMBER"
        }
      }
    }
  }
}