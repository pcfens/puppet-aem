# Private class to install/manage the AEM package
class aem::install inherits aem {
  if $aem::package_manage {
    package { $aem::package_name:
      ensure => $aem::package_ensure,
    }
  }
}
