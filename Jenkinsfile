pipeline {
    agent any

    stages {
        stage ('Clone from git') {
            steps {
                git 'https://github.com/NivShemesh/my-hometask.git'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
            }
        }
        stage('Build') {
            steps {
                echo 'Building...'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}
