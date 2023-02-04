pipeline {
    agent {
        label "Ubuntu-C"
    }
    stages {
        stage('Build step') {
            steps {
                script {
                    def customImage = docker.build("nginx-im:custom","-f nginx/Dockerfile .")
                }
            }
        }
        stage("run step") {
            steps {
                script {
                    sh "docker run -tid -p 80:80 nginx-im:custom"
                }
            }
        }
    }
}