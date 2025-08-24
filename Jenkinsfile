pipeline {
    agent any
    environment {
        DOTNET_ROOT = '/usr/share/dotnet'
        PATH = "${DOTNET_ROOT}:${PATH}"
    }
    stages {
        stage('Restore') {
            steps {
                echo '📦 Restoring packages...'
                sh 'dotnet restore SoftUniBazar.sln'
            }
        }
        stage('Build') {
            steps {
                echo '🔨 Building solution...'
                sh 'dotnet build SoftUniBazar.sln --configuration Release'
            }
        }
        stage('Test') {
            steps {
                echo '🧪 Running tests...'
                sh 'dotnet test SoftUniBazar.Tests/SoftUniBazar.Tests.csproj --no-build --logger "trx;LogFileName=TestResults.trx" --results-directory ./TestResults'
                sh 'dotnet test SoftUniBazar.IntegrationTests/SoftUniBazar.IntegrationTests.csproj --no-build --logger "trx;LogFileName=IntegrationTestResults.trx" --results-directory ./TestResults'
            }
        }
    }
    post {
        always {
            echo '📂 Archiving test results...'
            junit 'TestResults/*.trx'
        }
    }
}