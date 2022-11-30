pipeline {
    agent any
    options {
        buildDiscarder(logRotator(numToKeepStr: '4', artifactNumToKeepStr: '4'))
    }
    environment {
        AWS_ACCESS_KEY_ID     = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
        KEYS_MACHINE_1        = credentials('keys-machine-1')
        KEYS_MACHINE_2        = credentials('keys-machine-2')
        KEYS_MACHINE_1_PUB    = credentials('keys-machine-1.pub')
        KEYS_MACHINE_2_PUB    = credentials('keys-machine-2.pub')
    }
    stages {
        stage("cloning repo") {
            steps {
                echo "infrastructure" 
                sh 'pwd'
                 dir('infrastructure') {
                     sh "echo ${KEYS_MACHINE_1} > keys-machine-1"
                     sh "echo ${KEYS_MACHINE_2} > keys-machine-2"
                     sh "echo ${KEYS_MACHINE_1_PUB} > keys-machine-1.pub"  
                     sh "echo ${KEYS_MACHINE_2_PUB} > keys-machine-2.pub"              
                     sh label: '' , script: 'terraform init -input=false -no-color'
                     sh label: '' , script: 'terraform plan -no-color'
                     sh label: '' , script: 'terraform apply -no-color -auto-approve'
                    // sh label: '' , script: 'terraform destroy -no-color -auto-approve'
                }
                dir('ansible'){
                    sh 'ansible-playbook playbook.yml -i inventory.txt'

                }
                sh 'pwd'
            }
        }
        
        stage("building image") {
                    steps {
                        echo "building..."                       
                    }
                }
        stage("create server"){
            
            steps {
                echo "creating server..."
            }
        }
        stage("deploy") {
           
            steps {
                script {
                    echo "deploying..."
                }
            }
        }
    }
}
