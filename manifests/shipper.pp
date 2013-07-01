# Class: logstash::shipper
class logstash::shipper (
  $workers         = 1,
  $config_template = 'logstash/shipper.conf.erb'
) inherits logstash::params {

  require logstash

  file { "$logstash::params::etc_dir/shipper.conf":
    ensure  => present,
    content  => template($config_template),
  }

  file { '/etc/init/logstash-shipper.conf':
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('logstash/logstash-shipper-upstart.erb'),
    notify  => Service['logstash-shipper'],
  }

  service { 'logstash-shipper':
    ensure    => running,
    provider  => 'upstart',
    require => File['/etc/init/logstash-shipper.conf'],
  }

}
