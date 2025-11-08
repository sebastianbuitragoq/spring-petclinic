pipeline {
    agent any

    stages {
        stage('Maven Build') {
            steps {
                bat 'mvn clean package -DskipTests'
            }
        }

        stage('Docker Build') {
            steps {
                bat 'docker build -t sebastianbuitragoq/spring-petclinic:latest .'
            }
        }

        stage('Docker Push') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerHub', passwordVariable: 'DOCKER_PASS', usernameVariable: 'DOCKER_USER')]) {
                    bat 'echo %DOCKER_PASS% | docker login -u %DOCKER_USER% --password-stdin'
                    bat 'docker push sebastianbuitragoq/spring-petclinic:latest'
                }
            }
        }
    }
}
