pipeline {
    agent none
    stages {
        stage('install puppet on slave') {
            agent { label 'slave'}
            steps {
                echo 'Install Puppet'
                sh "sudo apt-get install -y wget"
                sh "wget https://apt.puppetlabs.com/puppet-release-bionic.deb"
                sh "sudo dpkg -i puppet-release-bionic.deb"
                sh "sudo apt update"
                sh "sudo apt install -y puppet-agent"
            }
        }

        stage('configure and start puppet') {
            agent { label 'slave'}
            steps {
                echo 'configure puppet'
                sh "mkdir -p /etc/puppetlabs/puppet"
                sh "if [ -f /etc/puppetlabs/puppet/puppet.conf ]; then sudo rm -f /etc/puppetlabs/puppet.conf; fi"
                sh "echo '[main]\ncertname = node1.local\nserver = puppet' >> ~/puppet.conf"
                sh "sudo mv ~/puppet.conf /etc/puppetlabs/puppet/puppet.conf"
                echo 'start puppet'
                sh "sudo systemctl start puppet"
                sh "sudo systemctl enable puppet"
            }
        }

        stage('Sign in puppet certificate') {
            agent{ label 'master'}
            steps {
                sh "sudo /opt/puppetlabs/bin/puppet cert sign node1.local"
            }
        }

        stage('Install Docker-CE on slave through puppet') {
            agent{ label 'master'}
            steps {
                sh "sudo /opt/puppetlabs/bin/puppet apply /home/edureka/site.pp"
            }
        }

        stage('Install Docker-CE on slave through puppet') {
            agent{ label 'master'}
            steps {
                sh "sudo /opt/puppetlabs/bin/puppet apply /home/edureka/site.pp"
            }
        }

        stage('Git Checkout') {
            agent{ label 'slave'}
            steps {
                sh "git clone https://github.com/i-doit181/devops-webapp.git && git checkout feature"
            }
        }

        stage('Docker Build and Run') {
            agent{ label 'slave'}
            steps {
                sh "cd /home/edureka/devops-webapp"
                sh "docker build -t test ."
                sh "docker run -it -p 80:80 test"
            }
        }

        stage('Check if selenium test run') {
            agent{ label 'slave'}
            steps {
                sh "java -jar /tmp/test.jar"
            }
        }
    }
}