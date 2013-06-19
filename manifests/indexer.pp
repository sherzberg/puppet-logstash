# Class: logstash::indexer
class logstash::indexer (
  $workers         = 1,
  $config_template = 'logstash/indexer.conf.erb',
  $web_backend     = 'elasticsearch:///?local'
) inherits logstash::params {

  require logstash

  file { "$logstash::params::etc_dir/indexer.conf":
    ensure  => present,
    content  => template($config_template),
  }

  file { '/etc/init/logstash-indexer.conf':
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('logstash/logstash-indexer-upstart.erb'),
    notify  => Service['logstash-indexer'],
  }

  service { 'logstash-indexer':
    ensure    => running,
    provider  => 'upstart',
    require => File['/etc/init/logstash-indexer.conf'],
  }

}
