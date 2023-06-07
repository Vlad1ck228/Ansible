#!groovy
//  groovy Jenkinsfile
properties([disableConcurrentBuilds()])\

pipeline  {
        agent any
           
    stages {
        stage("Build") {
            steps {
                sh '''
                docker build -t vladhl/ansible .
                '''
            }
        }
        stage("docker login") {
            steps {
                echo " ============== docker login =================="
                withCredentials([usernamePassword(credentialsId: 'DockerHub-Credentials', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
                    sh '''
                    docker login -u $USERNAME -p $PASSWORD
                    '''
                }
            }
        }
        stage("docker push") {
            steps {
                echo " ============== pushing image =================="
                sh '''
                docker push vladhl/ansible
                '''
        stage("Postgres") {
            steps {
                sh '''
                docker run \
                --name ansible \
                -d vladhl/ansible
                '''
            }
        }
    }
}
