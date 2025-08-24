pipeline {
    agent any

    stages {
        stage('Restore') {
            steps {
                bat 'dotnet restore SoftUniBazar.sln'
            }
        }

        stage('Build') {
            steps {
                bat 'dotnet build SoftUniBazar.sln --configuration Release'
            }
        }

        stage('Test') {
            steps {
                bat 'dotnet test SoftUniBazar.Tests/SoftUniBazar.Tests.csproj --no-build --verbosity normal'
                bat 'dotnet test SoftUniBazar.IntegrationTests/SoftUniBazar.IntegrationTests.csproj --no-build --verbosity normal'
            }
        }
    }

    post {
        always {
            junit '**/TestResults/*.xml'
        }
        success {
            echo '✅ All tests passed successfully.'
        }
        failure {
            echo '❌ Some tests failed.'
        }
    }
}
