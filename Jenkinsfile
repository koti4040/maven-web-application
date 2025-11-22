pipeline
{
    agent any

    tools
    {
        maven 'Maven_3.9.9'
    }

    environment
    {
        buildNumber = "${BUILD_NUMBER}"
    }

    stages
    {
        stage('Checkout Code from GitHub')
        {
            steps()
            {
                git branch: 'DevOpsJulyBatch', url: 'https://github.com/MithunTechnologiesDevOps/maven-web-application.git'
            }
        }

        stage('Build Artifact')
        {
            steps()
            {
                sh 'mvn clean package'
            }
        }

        stage('Build Docker Image')
        {
            steps()
            {
                sh 'docker build -t 149536451818.dkr.ecr.ap-south-1.amazonaws.com/maven-web-application:${buildNumber} .'
            }
        }
    }
}