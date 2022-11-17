pipeline {
    agent any
    stages {
        stage("cloning repo") {
            steps {
                echo "cloning..." 
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
