pipeline {
    agent any

    stages {
        stage('Test') {
            steps {
                echo 'Testing..'
            }
        }
        stage('Build docker image') {
            steps {
                echo 'Building...'
                sh 'docker build -t devops-is-great:latest .'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}
