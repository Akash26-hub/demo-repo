include 'docker'

docker::image { 'ubuntu':
   image_tag => 'trusty',
}
