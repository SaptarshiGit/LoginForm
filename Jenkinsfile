pipeline{
    agent any
    environment{
        PATH = "/opt/apache-maven-3.6.3/bin:$PATH"
    }
    stages {       
        stage("Maven Build Code"){
            steps{
                sh "mvn clean install"
            }
        }
    }
}