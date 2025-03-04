
pipeline {
    agent {
        docker {
            image 'python:3.9'
        }
    }
    environment {
        APP_NAME = 'app.py'
        REQUIREMENTS_FILE = 'requirements.txt'
    }
    stages {
        stage('Checkout') {
            steps {
                echo 'Checking out source code...'
                checkout scm
            }
        }
        stage('Install Dependencies') {
            steps {
                echo 'Installing dependencies...'
                sh '''
                python -m pip install --upgrade pip
                pip install -r ${REQUIREMENTS_FILE}
                '''
            }
        }
        stage('Lint') {
            steps {
                echo 'Running linter...'
                sh 'pip install flake8'
                sh 'flake8 . --count --select=E9,F63,F7,F82 --show-source --statistics'
            }
        }
        stage('Test') {
            steps {
                echo 'Running tests...'
                sh 'pip install pytest'
                sh 'pytest'
            }
        }
        stage('Run Application') {
            steps {
                echo 'Running the Streamlit application...'
                sh "streamlit run ${APP_NAME} --server.port=8501 --server.headless=true"
            }
        }
    }
    post {
        always {
            echo 'Pipeline execution finished.'
        }
        success {
            echo 'Pipeline executed successfully!'
        }
        failure {
            echo 'Pipeline failed!'
        }
    }
}
