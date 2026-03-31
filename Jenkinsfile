pipeline{
    agent any
 
    stages{
    stage('Set service-name & tag') {
            steps {
                script {
                    env.SERVICE_NAME = env.JOB_NAME
                    env.TAG = "v${env.BUILD_NUMBER}"
                }
            }
        }
    stage('Build-Push-image'){
        steps{
            withCredentials([usernamePassword(
                    credentialsId: 'docker-cred',
                    usernameVariable: 'DOCKER_USER',
                    passwordVariable: 'DOCKER_PASS'
                )]) {

                    sh '''
					docker build -t  $DOCKER_USER/$SERVICE_NAME:$TAG .
                    docker tag $DOCKER_USER/$SERVICE_NAME:$TAG $DOCKER_USER/$SERVICE_NAME:latest
                    echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin
                    docker push $DOCKER_USER/$SERVICE_NAME:$TAG
                    docker push $DOCKER_USER/$SERVICE_NAME:latest
                    '''
			
			
			}
        }
    }
}
}