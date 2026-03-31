pipeline{
    agent any
    environment{
        SERVICE_NAME=${JOB_NAME}
        TAG="v${BUILD_NUMBER}"
    }
    stages{
 
    stage('Build-Push-image'){
        steps{
            withCredentials([usernamePassword(
                    credentialsId: 'docker-cred',
                    usernameVariable: 'DOCKER_USER',
                    passwordVariable: 'DOCKER_PASS'
                )]) {

                    sh '''
					docker build -t  $DOCKER_USER/$SERVICE_NAME:$TAG .
                    echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin
                    docker push $DOCKER_USER/$SERVICE_NAME:$TAG
                    '''
			
			
			}
        }
    }
}
}