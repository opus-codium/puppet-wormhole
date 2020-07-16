# @summary Manage magic-wormhole
#
# @param manage_package Whether the wormhole package should be managed by the module
# @param package_name Name of the wormhole package
# @param package_ensure Ensure value for the wormhole package resource
# @param package_provider Package provider to manage the wormhole package with
class wormhole (
  Boolean          $manage_package   = true,
  String           $package_name     = 'magic-wormhole',
  String           $package_ensure   = 'installed',
  Optional[String] $package_provider = undef,
) {
  contain wormhole::package
}
