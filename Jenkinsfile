node {

    properties([
            parameters([
                    string(name: 'dockerRegistry',
                            defaultValue: 'registry.hub.docker.com',
                            description: 'The docker registry to use (DNS name only)',),
                    string(name: 'dockerRepository',
                            defaultValue: 'tle249/jenkin1',
                            description: 'The repository to push to',),
                    string(name: 'dockerRegistryCredentialsId',
                            defaultValue: 'dockerhub-jenkinfile-credentials',
                            description: 'The Jenkins credentials id for docker registry to use',)
            ])
    ])

    stage('Checkout') {
        checkout scm
    }

    docker.image('jenkin').inside {
        withMaven() {
            stage('Maven Build') {
                sh '"$MVN_CMD" clean package'
            }

            stage('Maven Deploy') {
                sh '"$MVN_CMD" -DskipTests deploy'
            }
        }

    }

    docker.withRegistry("https://${dockerRegistry}", "${dockerRegistryCredentialsId}") {

        stage('Docker Build') {
            image = docker.build('${dockerRegistry}/$(dockerRepository)', "--pull --no-cache .")
        }

        stage('Docker Push') {
            image.push()
        }
    }

}