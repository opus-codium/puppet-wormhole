class wormhole::package {
  if $wormhole::manage_package {
    package { $wormhole::package_name:
      ensure => $wormhole::package_ensure,
    }
  }
}
