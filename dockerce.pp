include docker

class { 'docker':
  use_upstream_package_source => false,
}

class { 'docker':
  version => '17.09.0~ce-0~debian',
}

class { 'docker':
  docker_ee => true,
  docker_ee_source_location => 'https://download.docker.com/linux/ubuntu/dists/xenial/stable/',
  docker_ee_key_source => 'https://download.docker.com/linux/ubuntu/gpg',
}
