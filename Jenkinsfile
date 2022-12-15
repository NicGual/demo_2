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

        // stage("unit tests") {
        //     when { anyOf {  branch 'DD2-*'; branch 'Development' } }
        //     steps {
        //         echo "Testing Component"
        //         sh 'cp -r -a app app_test' 
        //         dir('app_test'){                  
        //             sh 'npm install'
        //             sh 'npm test'
        //         }
        //     }            
        // }

        // stage("Building s3 bucket & ECR") {
        //     when { branch 'Development' }
        //     steps {
        //         echo "Building infrastructure" 
        //         sh 'pwd'
        //          dir('infrastructure/development/static') {              
        //              sh label: '' , script: 'terraform init -force-copy -no-color'
        //              sh label: '' , script: 'terraform plan -no-color'
        //              sh label: '' , script: 'terraform apply -no-color -auto-approve'
        //              script {ecr_url= sh (script: "terraform output --raw ecr_url", returnStdout: true)}
        //         }              
        //     }
        // }

        // stage("Building Production Infrastructure") {
        //     when { branch 'main' }
        //     steps {
        //         echo "Building infrastructure" 
        //         sh 'pwd'
        //          dir('infrastructure/production') {              
        //              sh label: '' , script: 'terraform init -force-copy -no-color'
        //              sh label: '' , script: 'terraform plan -no-color'
        //              sh label: '' , script: 'terraform apply -no-color -auto-approve'
        //              script {ecr_url= sh (script: "terraform output --raw ecr_url", returnStdout: true)}
        //              sh label: '' , script: 'terraform destroy -no-color -auto-approve'
        //         }
                
        //     }
        // }

        stage("Building development Infrastructure") {
            when { branch 'Development' }
            steps {
                echo "Building infrastructure" 
                sh 'pwd'
                // 'infrastructure/development'
                 dir('infrastructure/production') {              
                     sh label: '' , script: 'terraform init -force-copy -no-color'
                     sh label: '' , script: 'terraform plan -no-color'
                    //  sh label: '' , script: 'terraform apply -no-color -auto-approve'
                     sh label: '' , script: 'terraform destroy -no-color -auto-approve'
                }
                
            }
        }
        
        // stage("Providing Files") {
        //     when { anyOf { branch 'main'; branch 'Development' } }
        //     steps {
        //         echo "copying app" 
        //         dir('ansible'){
        //             sh 'ansible-playbook provide.yml --extra-vars="workspace=$WORKSPACE " -i inventory.txt '
        //         }
        //     }
            
        // }

        // stage("Install & Configure AWS CLI"){
        //      when { anyOf { branch 'main'; branch 'Development' } }
        //     steps {                
        //         echo "Configuring AWS CLI on machines"
        //         dir('ansible'){
        //             sh 'ansible-playbook aws-configure.yml --extra-vars="ak=$AWS_ACCESS_KEY_ID sak=$AWS_SECRET_ACCESS_KEY" -i inventory.txt -vvv'
        //         }
        //     }
        // }

        // stage("Building Images"){
        //      when { anyOf { branch 'main'; branch 'Development' } }
        //     steps {
        //         echo "Building app Image"
        //         dir('ansible'){
        //             sh "ansible-playbook docker-build.yml --extra-vars='image_tag=${GIT_HASH}' -i inventory.txt -vvv"
        //         }
        //     }

        // }
        // stage("Uploading image to ECR"){
        //      when { anyOf { branch 'main'; branch 'Development' } }
        //     steps {
        //         echo "ECR repository"
        //         echo "${ecr_url}"
        //         echo "Uploading Image"
        //         dir('ansible'){
        //             sh "ansible-playbook docker-push.yml --extra-vars='ecr_url=${ecr_url} image_tag=${GIT_HASH}' -i inventory.txt -vvv"
        //         }
        //     }
        // }
        // stage("Destroying Old Images"){
        //      when { anyOf { branch 'main'; branch 'Development' } }
        //     steps {                
        //         echo "Destroying Image"
        //         dir('ansible'){
        //             sh "ansible-playbook docker-destroy.yml -i inventory.txt -vvv"
        //         }
        //     }
        // }
        
        // stage("Deploying App"){
        //      when { anyOf { branch 'main'; branch 'Development' } }
        //     steps {                
        //         echo "Deploying App"
        //         dir('ansible'){
        //             sh "ansible-playbook docker-deploy.yml --extra-vars='ecr_url=${ecr_url} image_tag=${GIT_HASH}' -i inventory.txt -vvv"
        //         }
        //     }

        // }
    }
}
