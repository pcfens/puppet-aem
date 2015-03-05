# A private class to setup basic aem configuration
class aem::config inherits aem {
  file { "${aem::sling_home}/../license.properties":
    ensure  => present,
    owner   => $aem::user,
    group   => $aem::group,
    content => template('aem/license.properties.erb'),
    notify  => Service['aem'],
    require => [
      User[$aem::user],
      Group[$aem::group],
    ]
  }

  file { "${aem::sling_home}/bin/start":
    ensure  => present,
    owner   => $aem::user,
    group   => $aem::group,
    content => template('aem/start.erb'),
    notify  => Service['aem'],
    require => [
      User[$aem::user],
      Group[$aem::group],
    ]
  }

  file { '/etc/init.d/aem':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    content => template('aem/aem.init.erb'),
  }

}
