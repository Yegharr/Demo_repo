pipleline {
    agent  {
        ssh {
            host = '192.168.20.14'
            user = 'jenkins'
            password = 'secret'
            port = 22
        }
    }

stages {
        stage('Build step') {
            steps {
                script {
                withCredentials([string(credentialsId:'docker_user', variable:'DOCKER_USER'),
                                string(credentialsId:'docker_pass',variable:'DOCKER_PASS')]) {
                sh "echo ${DOCKER_PASS} | docker login --username ${DOCKER_USER}  --password-stdin"
                docker.withRegistry("https://index.docker.io") {
                def customImage = docker.build("${DOCKER_USER}/nginx:${env.BUILD_ID}", "-f nginx/Dockerfile .")
                customImage.push()
                }
                }
            }
        }
    }
        stage("Run step") {
            steps {
                script {
                    withCredentials([string(credentialsId:'docker_user', variable:'DOCKER_USER'),
                                string(credentialsId:'docker_pass',variable:'DOCKER_PASS')]) {
                    sh "./script.sh"
                    sh "docker run -tid -p 80:80 --name test_container ${DOCKER_USER}/nginx:${env.BUILD_ID}"
                    }
                }
            }
        }
    }
}
