# Install and manage AEM
class aem (
  $sling_home,
  $license_customer,
  $license_key,
  $license_product_version = $aem::params::license_product_version,
  $license_product_name    = $aem::params::license_product,
  $package_manage          = $aem::params::package_manage,
  $package_name            = $aem::params::package_name,
  $package_version         = $aem::params::package_version,
  $manage_user             = $aem::params::manage_user,
  $user                    = $aem::params::user,
  $group                   = $aem::params::group,
  $run_modes               = $aem::params::run_modes,
  $port                    = $aem::params::port,
  $hostname                = $aem::params::hostname,
  $jaas_config             = $aem::params::jaas_config,
  $jvm_options             = $aem::params::jvm_options,
  $file_size_limit         = $aem::params::file_size_limit,
  $service_ensure          = $aem::params::service_ensure,
  $service_enable          = $aem::params::service_enable,
) inherits aem::params {

  validate_array($run_modes, jvm_options)
  validate_string($sling_home, $license_customer, $license_key,
    $license_product_version, $license_product_name, $jaas_config
  )

  if $port == undef and 'author' in $run_modes {
    $real_port = 4502
  } elsif $port == undef {
    $real_port = 4504
  } else {
    $real_port = $port
  }

  anchor { 'aem::begin': } ->
  class { '::aem::user': } ->
  class { '::aem::install': } ->
  class { '::aem::config': } ->
  class { '::aem::service': } ->
  anchor { 'aem::end': }

}
