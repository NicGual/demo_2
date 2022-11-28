pipeline {
    agent any
    stages {
        stage("cloning repo") {
            steps {
                echo "cloning..." 
                sh 'pwd'
                // dir('infrastructure') {
                //     sh 'pwd'
                //     sh 'terraform init'
                //     sh 'terraform plan'
                //     sh 'terraform apply -auto-approve'
                // }
                dir('ansible'){
                    sh 'sudo ansible-playbook playbook.yml -i inventory.txt'

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
