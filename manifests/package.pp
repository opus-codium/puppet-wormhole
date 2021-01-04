# @summary Manage the wormhole package
class wormhole::package {
  assert_private()

  if $wormhole::manage_package {
    package { $wormhole::package_name:
      ensure   => $wormhole::package_ensure,
      provider => $wormhole::package_provider,
    }
  }
}
