# AEM default parameters
class aem::params {
  $license_product_version = '6.0.0.SP2'
  $license_product_name = 'Adobe Experience Manager'
  $hostname = undef
  $jaas_config = 'etc/jaas.config'
  $file_size_limit = 8192

  $package_manage = true
  $package_name = 'aem'
  $package_version = 'latest'

  $user = 'aem'
  $group = 'aem'

  $service_ensure = 'running'
  $service_enable = true

  $manage_user = true

  $run_modes = ['author', 'nosamplecontent']
  $port = 4502

  $jvm_options = [
    '-server',
    '-Xmx2048m',
    '-XX:MaxPermSize=256M',
    '-Djava.awt.headless=true',
  ]
}
