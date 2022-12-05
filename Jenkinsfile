def ecr_url
pipeline {
    agent any
    options {
        buildDiscarder(logRotator(numToKeepStr: '4', artifactNumToKeepStr: '4'))
    }
    environment {
        GIT_HASH              = sh (script: "git log -n 1 --pretty=format:'%H'", returnStdout: true)
        AWS_ACCESS_KEY_ID     = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
    }
    stages {
        stage("Building Infrastructure") {
            steps {
                echo "Building infrastructure" 
                sh 'pwd'
                 dir('infrastructure/production') {              
                     sh label: '' , script: 'terraform init -force-copy -no-color'
                     sh label: '' , script: 'terraform plan -no-color'
                     sh label: '' , script: 'terraform apply -no-color -auto-approve'
                     script {ecr_url= sh (script: "terraform output --raw ecr_url", returnStdout: true)}
                     sh label: '' , script: 'terraform destroy -no-color -auto-approve'
                }
                
            }
        }
        
        // stage("Providing Files") {
        //     steps {
        //         echo "copying app" 
        //         dir('ansible'){
        //             sh 'ansible-playbook provide.yml -i inventory.txt '
        //         }
        //     }
            
        // }

        // stage("Install & Configure AWS CLI"){
            
        //     steps {                
        //         echo "Configuring AWS CLI on machines"
        //         dir('app'){
        //             sh "ansible-playbook ../ansible/aws-configure.yml --extra-vars='ak=${AWS_ACCESS_KEY_ID} sak=${AWS_SECRET_ACCESS_KEY}' -i ../ansible/inventory.txt -vvv"
        //         }
        //     }
        // }

        // stage("Building Images"){
            
        //     steps {
        //         echo "Building app Image"
        //         dir('app'){
        //             sh "ansible-playbook ../ansible/docker-build.yml --extra-vars='image_tag=${GIT_HASH}' -i ../ansible/inventory.txt -vvv"
        //         }
        //     }

        // }
        // stage("Uploading image to ECR"){
            
        //     steps {
        //         echo "ECR repository"
        //         echo "${ecr_url}"
        //         echo "Uploading Image"
        //         dir('app'){
        //             sh "ansible-playbook ../ansible/docker-push.yml --extra-vars='ecr_url=${ecr_url} image_tag=${GIT_HASH}' -i ../ansible/inventory.txt -vvv"
        //         }
        //     }
        // }
        // stage("Destroying Old Images"){
            
        //     steps {                
        //         echo "Destroying Image"
        //         dir('app'){
        //             sh "ansible-playbook ../ansible/docker-destroy.yml -i ../ansible/inventory.txt -vvv"
        //         }
        //     }
        // }
        
        // stage("Deploying Container"){
            
        //     steps {                
        //         echo "Deploying Container"
        //         dir('app'){
        //             sh "ansible-playbook ../ansible/docker-deploy.yml --extra-vars='ecr_url=${ecr_url} image_tag=${GIT_HASH}' -i ../ansible/inventory.txt -vvv"
        //         }
        //     }

        // }
        // stage("Deploying Image") {
           
        //     steps {
        //         script {
        //             echo "deploying..."
        //         }
        //     }
        // }
    }
}
