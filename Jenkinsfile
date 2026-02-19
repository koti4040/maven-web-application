node
{
properties([buildDiscarder(logRotator(artifactDaysToKeepStr: '', artifactNumToKeepStr: '', daysToKeepStr: '5', numToKeepStr: '5')), pipelineTriggers([cron('* * * * *')])])

def mavenHome = tool name: "maven3.9.12"

echo "The job name is: ${env.JOB_NAME}"
echo "The Node name is: ${env.NODE_NAME}"
echo "The Build number is: ${env.BUILD_NUMBER}"
echo "The Jenkins Home Directory is: ${JENKINS_HOME}"


stage('checkoutcode')
{
         git branch: 'development', credentialsId: 'GitHub', url: 'https://github.com/koti4040/maven-web-application.git'
}
stage('Build')
{
         sh "${mavenHome}/bin/mvn clean package"
}
stage('ExecuteSonarQubeReport')
{
         sh "${mavenHome}/bin/mvn clean sonar:sonar"
}
stage('UploadArtifactsintoNexus')
{
        sh "${mavenHome}/bin/mvn clean deploy"
}
stage('DeployappIntoTomcatServer')
{
       sshagent(['3a98f948-4014-44fa-ad92-92a50058a37e']) 
	   {
	   
	   sh "scp -o strictHostKeyChecking=no target/maven-web-application.war ec2-user@172.31.19.73:/opt/tomcat9/webapps/"
    
       }
}
}
