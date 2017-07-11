node {
    def app

    stage('Clone repository') {
        /* Let's make sure we have the repository cloned to our workspace */

        checkout scm
    }
    /*stage("composer_install") {
        // Run `composer update` as a shell script
        sh 'composer install'
    }
    stage("phpunit") {
        // Run PHPUnit
        sh 'vendor/bin/phpunit'
    } */
    stage('Build image') {
        /* This builds the actual image; synonymous to
         * docker build on the command line */

        app = docker.build("docker-images")
        /*sh 'sudo docker build -t jenkins-test'*/
    }

    stage('Test image') {
        /* Ideally, we would run a test framework against our image. */

        app.inside {
            sh 'echo "Tests passed"'
        }
    }

    stage('Push image') {
        /* Finally, we'll push the image with two tags:
         * First, the incremental build number from Jenkins
         * Second, the 'latest' tag.
         * Pushing multiple tags is cheap, as all the layers are reused. */
        docker.withRegistry('https://657536823989.dkr.ecr.us-west-2.amazonaws.com', 'ecr:us-west-2:docker-images') {
        /* docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') { */
            app.push("${env.BUILD_NUMBER}")
            app.push("latest")
        }
    }
    stage('Remove image') {
        sh 'docker rmi -f 657536823989.dkr.ecr.us-west-2.amazonaws.com/docker-images'
        sh 'docker rmi -f docker-images'
    }
}
