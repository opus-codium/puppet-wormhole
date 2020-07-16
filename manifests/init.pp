class wormhole (
  Boolean $manage_package = true,
  String  $package_name   = 'magic-wormhole',
  String  $package_ensure = 'installed',
) {
  contain wormhole::package
}
