# A private class to manage the AEM user/group
class aem::user inherits aem {
  if $aem::manage_user {
    group { $aem::group:
      ensure => present,
      system => true,
    }

    user { $aem::user:
      ensure  => present,
      system  => true,
      gid     => $aem::group,
      require => Group[$aem::group],
    }
  }
}
