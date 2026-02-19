node
{
properties([buildDiscarder(logRotator(artifactDaysToKeepStr: '', artifactNumToKeepStr: '', daysToKeepStr: '5', numToKeepStr: '5')), pipelineTriggers([pollSCM('* * * * *')])])

echo "The job name is: ${env.JOB_NAME}"
echo "The Node name is: ${env.NODE_NAME}"
echo "The Build number is: ${env.BUILD_NUMBER}"
echo "The Jenkins Home Directory is: ${JENKINS_HOME}"

def mavenHome = tool name: "maven3.9.12"


try
{
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
}// try closing
 
catch(e)
  {
    // If there was an exception thrown, the build failed
    currentBuild.result = "FAILED"
    throw e
  } 
  finally 
  {
    // Success or failure, always send notifications
    sendSlackNotifications(currentBuild.result)
  }
}

// slack send notifications

def sendSlackNotifications(String buildStatus = 'STARTED') {
  // build status of null means successful
  buildStatus =  buildStatus ?: 'SUCCESSFUL'

  // Default values
  def colorName = 'RED'
  def colorCode = '#FF0000'
  def subject = "${buildStatus}: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]'"
  def summary = "${subject} (${env.BUILD_URL})"

  // Override default values based on build status
  if (buildStatus == 'STARTED') {
    colorName = 'YELLOW'
    colorCode = '#FFFF00'
  } else if (buildStatus == 'SUCCESSFUL') {
    colorName = 'GREEN'
    colorCode = '#00FF00'
  } else {
    colorName = 'RED'
    colorCode = '#FF0000'
  }

  // Send notifications
  slackSend (color: colorCode, message: summary)
}



