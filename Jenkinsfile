pipeline {
    agent {
        docker {
            image 'ruby'
        }
    }
    environment {
        CI = true
    }
    stages {
        stage('Bundle') {
            steps {
                sh "gem install bundler"
                sh "bundle install"
            }
        }
        stage('Run Features') {
            steps {
                sh "bundle exec cucumber"
            }
        }
    }
}