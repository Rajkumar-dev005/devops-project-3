pipeline {
    agent any
    environment {
        DOCKERHUB_USER = 'rajdevops5'
        DEV_IMAGE = 'rajdevops5/devops-project-3-build-dev'
        PROD_IMAGE = 'rajdevops5/devops-project-3-build-prod'
    }
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Build') {
            steps {
                sh 'bash build.sh ${DEV_IMAGE} ${BUILD_NUMBER}'
            }
        }
        stage('Push') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub-credentials', usernameVariable: 'USER', passwordVariable: 'PASS')]) {
                    sh '''
                        echo $PASS | docker login -u $USER --password-stdin
                        if [ "${GIT_BRANCH}" = "origin/master" ]; then
                            docker tag ${DEV_IMAGE}:${BUILD_NUMBER} ${PROD_IMAGE}:${BUILD_NUMBER}
                            docker push ${PROD_IMAGE}:${BUILD_NUMBER}
                        else
                            docker push ${DEV_IMAGE}:${BUILD_NUMBER}
                        fi
                    '''
                }
            }
        }
        stage('Deploy') {
            steps {
                sh 'bash deploy.sh ${DEV_IMAGE} ${BUILD_NUMBER}'
            }
        }
    }
}
