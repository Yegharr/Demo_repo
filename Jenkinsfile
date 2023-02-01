pipeline {
    agent any
    stages {
        stage('Build step') {
            steps {
                script { 
                    def customImage = docker.build("my-image:${env.BUILD_ID}", "-f nginx/Dockerfile .")
                }
            }
        }
        stage("run step") {
            steps {
                script {
                    docker.image("my-image:${env.BUILD_ID}").withRun('-p 5000:80') {    
                    
                    }
                }
            }
        }
    }
}