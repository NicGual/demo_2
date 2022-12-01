pipeline {
    agent any
    options {
        buildDiscarder(logRotator(numToKeepStr: '4', artifactNumToKeepStr: '4'))
    }
    environment {
        AWS_ACCESS_KEY_ID     = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
    }
    stages {
        stage("cloning repo") {
            steps {
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
        
        stage("Configuring Machines") {
            steps {
                echo "building..." 
                dir('ansible'){
                    sh 'ansible-playbook playbook.yml -i inventory.txt'
                }
                sh 'pwd'
            }
        }
        stage("Building Images"){
            
            steps {
                echo "Building app Image"
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
