pipeline {
    agent { label 'dev' }

    // 🔹 Add this triggers block
    triggers {
        githubPush()
    }

    stages {

        stage('Clone GitHub Repo') {
            steps {
                git url: 'https://github.com/Ritikrpati23032003/docker_python_flask-project.git',
                    branch: 'main'
            }
        }

        stage('Login to AWS ECR') {
            steps {
                withCredentials([[$class: 'AmazonWebServicesCredentialsBinding',
                                  credentialsId: 'aws-ecr-creds']]) {
                    sh '''
                      aws ecr get-login-password --region us-east-1 \
                      | docker login --username AWS --password-stdin \
                        301678011164.dkr.ecr.us-east-1.amazonaws.com
                    '''
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t flask-app:latest .'
            }
        }

        stage('Tag Docker Image') {
            steps {
                sh '''
                  docker tag flask-app:latest \
                  301678011164.dkr.ecr.us-east-1.amazonaws.com/flask-app:latest
                '''
            }
        }

        stage('Push Image to ECR') {
            steps {
                sh '''
                  docker push \
                  301678011164.dkr.ecr.us-east-1.amazonaws.com/flask-app:latest
                '''
            }
        }
    }
}
