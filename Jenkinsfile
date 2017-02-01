node {
    /* .. snip .. */
    stage('Build') {
        
        echo "Running ${env.BUILD_ID} on ${env.JENKINS_URL}"
        echo "Branch: ${env.BRANCH_NAME}"
        checkout scm
        sh -x $WORKSPACE/build-jenkins.sh
    }
    /* .. snip .. */
}
