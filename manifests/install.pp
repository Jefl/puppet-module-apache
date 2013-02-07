class apache::install {
  case $::operatingsystem {
    redhat,centos,fedora,Scientific: {
      $http_package = 'httpd'
    }
    Debian,Ubuntu: {
      $http_package = 'apache2'
    }
    default: {
      fail("${::hostname}: This module does not support operatingsystem ${::operatingsystem}")
    }
  }

  package { 'httpd':
    alias  => 'apache',
    name => $http_package,
    ensure => present,
  }
}
