pipeline {
    agent any

    tools {
        maven 'Maven 3.9.9'
    }

    environment {
        IMAGE_NAME = 'sebastianbuitrago/spring-petclinic:latest'
    }

    stages {
        stage('Maven Build') {
            steps {
                bat 'mvn clean package -DskipTests'
            }
        }

        stage('Docker Build') {
            steps {
                bat 'docker build -t %IMAGE_NAME% .'
            }
        }

        stage('Docker Push') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'sebastianbuitrago', passwordVariable: 'DOCKER_PASS', usernameVariable: 'DOCKER_USER')]) {
                    bat 'echo %DOCKER_PASS% | docker login -u %DOCKER_USER% --password-stdin'
                    bat 'docker push %IMAGE_NAME%'
                }
            }
        }

        stage('Run Application') {
            steps {
                bat 'docker run -d -p 8081:8080 %IMAGE_NAME%'
            }
        }
    }
}
