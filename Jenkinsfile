pipeline {
    agent any
    options {
        buildDiscarder(logRotator(numToKeepStr: '4', artifactNumToKeepStr: '4'))
    }
    environment {
        GIT_COMMIT_HASH       = sh (script: "git log -n 1 --pretty=format:'%H'", returnStdout: true)
        AWS_ACCESS_KEY_ID     = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
    }
    stages {
        stage("cloning repo") {
            steps {
                echo "${GIT_COMMIT_HASH}"
                echo "Building infrastructure" 
                sh 'pwd'
                 dir('infrastructure') {              
                     sh label: '' , script: 'terraform init -input=false -no-color'
                     sh label: '' , script: 'terraform plan -no-color'
                     sh label: '' , script: 'terraform apply -no-color -auto-approve'
                    // sh label: '' , script: 'terraform destroy -no-color -auto-approve'
                }
                
            }
        }
        
        stage("Providing Files") {
            steps {
                echo "copying app" 
                dir('ansible'){
                    sh 'ansible-playbook provide.yml -i inventory.txt -vvv'
                }
            }
            
        }
        stage("Building Images"){
            
            steps {
                echo "Building app Image"
                dir('ansible'){
                    sh 'ansible-playbook provide.yml -i inventory.txt -vvv'
                }
            }
        }
        stage("Deploying Image") {
           
            steps {
                script {
                    echo "deploying..."
                }
            }
        }
    }
}
