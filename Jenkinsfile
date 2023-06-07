#!groovy
//  groovy Jenkinsfile
properties([disableConcurrentBuilds()])\

pipeline  {
        agent { 
           label ''
        }

    options {
        buildDiscarder(logRotator(numToKeepStr: '10', artifactNumToKeepStr: '10'))
        timestamps()
    }
    stages {
        stage("Git clone") {
            steps {
                sh '''
                cd /home/ubuntu/ansible/
                git clone https://https://github.com/Vlad1ck228/Ansible.git         
                '''
            }
        }    
        stage("Build") {
            steps {
                sh '''
                cd /home/ubuntu/ansible/
                docker build -t vladhl/ansible .
                '''
            }
        } 
        stage("Postgres") {
            steps {
                sh '''
                docker run \
                --name ansible \
                -d vladhl/ansible
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
            }
        }
    }
}
