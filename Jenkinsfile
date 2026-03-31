pipeline{
    agent any
    environment{
        DOCKER_IMG="maheshg98/my-login-app"
        TAG="v1"
    }
    stages{
    stage('Build image'){
        steps{
            sh "docker build -t ${DOCKER_IMG}:${TAG} ."
        }
    }
    stage('Push-image'){
        steps{
            withCredentials([usernamePassword(
                    credentialsId: 'docker-cred',
                    usernameVariable: 'DOCKER_USER',
                    passwordVariable: 'DOCKER_PASS'
                )]) {

                    sh '''
					
                    echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin
                    docker push $DOCKER_IMG:$TAG
                    '''
			
			
			}
        }
    }
}
}