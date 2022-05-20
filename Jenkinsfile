@Library('me') _
me = initScript(this)
me.properties()

node {

  String imageName = "sherlock-${params.ambiente}"

  me.init(timeout: 5, timeoutUnit: 'HOURS') {

    me.stage('Checkout SCM') {
      checkout scm
    }

    me.stage('Build Environment') {
      dockerImage = docker.build(imageName, '-f ./Dockerfile .')
    }
    
    try {
      me.stage('Run Tests') {
        dockerImage.inside("-u root --name sherlock-${params.env} --shm-size=2g") {
            sh "robot -d ./logs -i ${params.tag} -v env:${params.env} -v headless:${params.headless} tests/"
        }
      }
    } finally {
        me.stage('Create Report') {
          robot archiveDirName: 'robot-plugin', logFileName: '**/logs/log.html', otherFiles: '**/logs/browser/screenshot/*.png', outputFileName: '**/logs/output.xml', outputPath: '', overwriteXAxisLabel: '', reportFileName: '**/logs/report.html'
        }

        me.stage('Destroy Environment') {
            sh "rm -rf /logs"
            cleanWs()
      }

    }
  }

}


