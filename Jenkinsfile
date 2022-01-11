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
        stage("Docker Image Build"){
            steps{
                sh "docker build -t saptarshigit/docker-jenkins --pull=true /var/lib/jenkins/workspace/GitHubExample"
            }
        }
        stage ("Docker Image Push"){
            steps{
                sh "docker push saptarshigit/docker-jenkins"
            }
        }
        stage ("Docker Image Deploy"){
            steps{
                sh "ssh root@172.31.1.214 /App/docker_scripts/deploy.sh saptarshigit/docker-jenkins:latest"
                
                sh "ssh root@172.31.10.10 /App/docker_scripts/deploy.sh saptarshigit/docker-jenkins:latest"
            }
        }
        stage ("Stop Docker Container"){
            steps{
                sh "ssh root@172.31.1.214 /App/docker_scripts/stop_container.sh app_instance_11"
                
                sh "ssh root@172.31.1.214 /App/docker_scripts/stop_container.sh app_instance_12"
            }
        }
        stage ("Start Docker Container"){
            steps{
                sh "ssh root@172.31.1.214 /App/docker_scripts/run_container.sh app_instance_11 saptarshigit/docker-jenkins:latest /log/app_instance_11/app_instance_11.log 3001"
                
                sh "ssh root@172.31.1.214 /App/docker_scripts/run_container.sh app_instance_12 saptarshigit/docker-jenkins:latest /log/app_instance_12/app_instance_12.log 3002"
            }
        }
    }
}