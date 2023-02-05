pipeline {
    agent {
        label "Ubuntu-C"
    }
    stages {
        stage('Build step') {
            steps {
                script {
                    def customImage = docker.build("nginx:${env.BUILD_ID}", "-f nginx/Dockerfile .")
                }
            }
        }
        stage("Run step") {
            steps {
                script {
                    def command = "./script.sh"
                    sh "docker run -tid -p 80:80 --name=test_container nginx:${env.BUILD_ID}"
                }
            }
        }
    }
}
