@Library('me') _
me = initScript(this)
me.properties()

node {
  
  String imageName = "sherlock-${params.tag}-${params.env}"

  me.init(timeout: 5, timeoutUnit: 'HOURS') {
    me.stage('Checkout SCM') {
      checkout scm
    }

    me.stage('Build Environment') {
      dockerImage = docker.build(imageName, '-f ./Dockerfile .')
    }
    
    dockerImage.inside("-u root --name sherlock-${params.tag}-${params.env} --shm-size=2g") {
        
      try {
        me.stage('Run Tests') {
          sh "robot -d ./logs -i ${params.tag} -v env:${params.env} -v headless:${params.headless} tests/ || robot -d ./logs/retry -v env:${params.env} -v headless:${params.headless} --rerunfailed ./logs/output.xml --output output.xml tests/"
        }

      } finally {
        me.stage('Create Report') {
          if (fileExists('./logs/retry/')) {
            sh "rebot -d ./logs --merge ./logs/output.xml ./logs/retry/output.xml | cp \$(find ./logs/retry/browser -type f -name '*.png') ./logs/browser/screenshot"
          }
          
          robot archiveDirName: 'robot-plugin', enableCache: false, logFileName: '**/logs/log.html', otherFiles: '**/logs/**/*.png', outputFileName: '**/logs/output.xml', outputPath: '', overwriteXAxisLabel: '', reportFileName: '**/logs/report.html'
        }

        me.stage('Destroy Environment') {
          sh "rm -rf **/logs"
          cleanWs()     
        }
      }
    }
  }
}





