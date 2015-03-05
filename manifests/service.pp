# A private class to manage the AEM service
class aem::service inherits aem {
  service { 'aem':
    ensure     => $aem::service_ensure,
    enable     => $aem::service_enable,
    hasrestart => false,
    hasstatus  => true,
  }
}
