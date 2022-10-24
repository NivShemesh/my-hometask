pipeline {
    agent any

    stages {
        stage ('SCM Checkout') {
            steps {
                git 'https://github.com/NivShemesh/my-hometask.git'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
            }
        }
        stage('Build docker image') {
            steps {
                echo 'Building...'
                sh 'docker build -t devops-is-great:$BUILD_NUMBER'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}
