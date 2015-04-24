# == Class: nco
#
# Module to allow yum install and dependency management of nco 
# while allowing you to pick repos to enable for the run.
#
# === Parameters
#
# [*ensure_version*]
#  Ensure parameter passed to Package resource to ensure specific version or other 
#   option such as latest
#   Default: latest
#
# === Examples
#
#  class { '::nco':
#    ensure_version => '2.1.5-2.el7.nux',
#  }
#
# === Authors
#
# Adam S <asa188@sfu.ca>
#
# === Copyright
#
# Copyright 2015 Simon Fraser University, unless otherwise noted.
#
class nco (
  $ensure_version = 'latest',
  $required_repos = $::nco::params::required_repos
  ) inherits ::nco::params {
  package { 'nco':
    ensure          => "${ensure_version}",
    install_options => { "--enablerepo" => "${required_repos}" },
  }
  package { 'nco-devel':
    ensure          => "${ensure_version}",
    install_options => { "--enablerepo" => "${required_repos}" },
  }
}
