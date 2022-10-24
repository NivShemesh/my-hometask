pipeline {
    agent any
    options {
        skipStagesAfterUnstable()
    }
    stages {
         stage('Clone repository') { 
            steps { 
                script{
                checkout scm
                }
            }
        }
        
        stage('Test'){
            steps {
                 echo 'Testing...'
            }
        }

        stage('Build') { 
            steps { 
                script{
                 app = docker.build("Devops-is-great")
                }
            }
        }

        stage('Deploy') {
            steps {
                script{
                    docker.withRegistry('https://registry.hub.docker.com', 'git') {
                    app.push("${env.BUILD_NUMBER}")
                    app.push("latest")
                    }
                }
            }
        }
    }
}
