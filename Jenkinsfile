```groovy
pipeline {
    agent {
        docker {
            image 'r-base:latest' // R language environment
        }
    }
    environment {
        FLASK_APP = 'app.py' // Update this to match your main Flask application file
    }
    stages {
        stage('Install Dependencies') {
            steps {
                sh '''
                apt-get update && apt-get install -y python3-pip
                python3 -m pip install --no-cache-dir -r Requirements.txt
                '''
            }
        }
        stage('Run Flask Application') {
            steps {
                sh '''
                python3 $FLASK_APP
                '''
            }
        }
    }
}
```