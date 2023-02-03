pipeline {
    agent {
        label "Ubuntu-C"
    }
    stages {
        stage('Build step') {
            steps {
                script {
                    def customImage = docker.build("my-image:custom", "-f nginx/Dockerfile .")
                }
            }
        }
        stage("run step") {
            steps {
                script {
                    sh "docker run -tid -p 80:80 my-image:custom"
                }
            }
        }
    }
}