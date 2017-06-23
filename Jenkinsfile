pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                echo 'build steps go here'
            }
        }
        stage('Test') {
            steps {
                echo 'test steps go here'
            }
        }
        stage('Deploy') {
            when { branch 'master' }
            steps {
                echo 'deploy steps go here'
            }
        }
        stage('Smoke Tests') {
            when { branch 'master' }
            steps {
                echo 'smoke test steps go here'
            }
        }
    }
}
