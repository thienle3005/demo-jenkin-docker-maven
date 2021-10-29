pipeline {
  environment {
    registry = "tle249/jenkin1"
    registryCredential = "dockerhub-jenkinfile-credentials"
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
    stage('Deploy image') { 
22
            steps { 
23
                script { 
24
                    docker.withRegistry( 'tle249/jekin1', registryCredential ) { 
25
                        dockerImage.push() 
26
                    }
27
                } 
28
            }
29
        } 
  }
}