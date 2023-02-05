pipeline {
    agent {
        label "Ubuntu-C"
    }
    stages {
        stage('Build step') {
            steps {
                script {               
                   def container_name= "test_container"
                    sh "if docker ps -a | grep -q ${container_name}; then
                        docker rm -f ${container_name}
                        fi"
                    def customImage = docker.build("nginx:${env.BUILD_ID}","-f nginx/Dockerfile .")
                }
            }
        }
        stage("run step") {
            steps {
                script {
                    sh "docker run -tid -p 80:80 --name=${container_name}  nginx:${env.BUILD_ID}"
                }
            }
        }
    }
}

