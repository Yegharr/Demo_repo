pipeline {
    agent any
    stages {
        stage('Build step') {
            steps {
                script { 
                    def customimage = docker.build("my-image:${env.BUILD_ID}", "-f nginx/Dockerfile .")
                }
            }
        }
    }
}