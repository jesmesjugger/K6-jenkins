node {
    stage('Pull changes') {
        git branch: 'main', url: 'https://github.com/sobraljuanpa/postk6.git'
    }


    stage('Deploy app locally') {
        nodejs('nodejs') {
        sh 'cd app && yarn install --production'
        sh 'cd app && node src/index.js &'
      }
    }


    stage('Run performance tests') {
        sh 'k6 run --vus 1200 --iterations 1200 script.js'
    }


    stage('Stop app') {
        nodejs('nodejs') {
        sh 'npx kill-port 3000'
      }
    }
}
