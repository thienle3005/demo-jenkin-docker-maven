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
    stage('Push image') {
        /* Finally, we'll push the image with two tags:
         * First, the incremental build number from Jenkins
         * Second, the 'latest' tag. */
            withCredentials([usernamePassword( credentialsId: 'docker-hub-credentials', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
		
          docker.withRegistry('', 'docker-hub-credentials') {
          sh "docker login -u ${USERNAME} -p ${PASSWORD}"
           myImage.push("${env.BUILD_NUMBER}")
           myImage.push("latest")
         }
  }
}
}