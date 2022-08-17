pipeline {
	agent none
	stages {
		stage ('Build docker image boxfuse & push artifact.ml') {
			agent {
				docker {
					args '-v /var/run/docker.sock:/var/run/docker.sock -u root'
					image 'build'
					registryCredentialsId '7d67fb9f-a259-47c8-bb64-a28e8471034c'
					registryUrl "http://artifact.ml:8888"
				}
			}
			steps {
				sh 'git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git /opt/app'
				sh 'mvn package -f /opt/app'
				sh 'docker build /opt --tag="artifact.ml:8888/webapp"'
				sh 'docker push artifact.ml:8888/webapp'
			}
		}
		stage ('ssh connect & docker run') {
            input {
				message "Container built can we run?"
				ok "Let's go"
			}
			agent any
			steps {
				sh '''ssh root@87.239.105.226 << EOF
				docker run --rm -d --name boxfuse -p 80:8080 artifact.ml:8888/webapp
				EOF'''
			}
		}
	}
}