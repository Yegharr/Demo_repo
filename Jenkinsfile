
pipeline {
    agent {
        label "Ubuntu-C"
    }
    stages {
        stage('Build step') {
            steps {
                script {               
                     def customImage = docker.build("nginx:${env.BUILD_ID}","-f nginx/Dockerfile .")
                     def command = "./script.sh"
                }
            }
        }
        stage("Run step") {
            steps {
                script {
                    container_name ="test_container"
                    
                                        
                    sh "docker run -tid -p 80:80 --name=${container_name}  nginx:${env.BUILD_ID}"
                }
            }
        }
    }
}
