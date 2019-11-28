def g_rls_img_tag = ""

pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                scripts {
                    echo 'Building..'
                    sh './gradlew clean build'
                }
            }
        }
        stage('Build and publish docker image') {
            steps {
                scripts {
                    echo 'Build and publish docker image'
                    g_rls_img_tag = env.BRANCH_NAME.replaceAll(~/\//, "-").toLowerCase()
                    sh "${WORKSPACE}/scripts/docker-build-upload.sh Testing-fx-rates ${g_rls_img_tag} ${env.BRANCH_NAME}"
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