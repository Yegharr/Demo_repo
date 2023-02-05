pipeline {
    agent {
        label "Ubuntu-C"
    }
    stages {
        stage('Build step') {
            steps {
                script {               
                   sh  "if [$(docker ps -a -q -f name=testcontainer)]; then 
                        docker rm -f testcontainer
                        fi "
                        
                    def customImage = docker.build("nginx:${env.BUILD_ID}","-f nginx/Dockerfile .")
                }
            }
        }
        stage("run step") {
            steps {
                script {
                    sh "docker run -tid -p 80:80 --name testcontainer  nginx:${env.BUILD_ID}"
                }
            }
        }
    }
}

