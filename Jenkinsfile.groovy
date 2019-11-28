def g_rls_img_tag = ""

pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                script {
                    echo 'Building..'
                    sh './gradlew clean build'
                }
            }
        }
        stage('Build and publish docker image') {
            steps {
                script {
                    echo 'Build and publish docker image'
                    g_rls_img_tag = env.BRANCH_NAME.replaceAll(~/\//, "-").toLowerCase()
                    sh "docker build --tag asia.gcr.io/shektest/Testing-fx-rates:feature-testing1 ."
                    sh "docker push asia.gcr.io/shektest/Testing-fx-rates:feature-testing1"
                    //sh "${WORKSPACE}/scripts/docker-build-upload.sh Testing-fx-rates ${g_rls_img_tag} ${env.BRANCH_NAME}"
                }
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}