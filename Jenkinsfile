pipeline {
    agent {
        label "Ubuntu-C"
    }
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
                    sh "docker run -tid -p 80:80 my-image:${env.BUILD_ID}"
                }
            }
        }
    }
}