class logstash::web (
  $elasticsearch_backend = "elasticsearch:///?local"
) inherits logstash::params {

  require logstash

  file { '/etc/init/logstash-web.conf':
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('logstash/logstash-web-upstart.erb'),
    notify  => Service['logstash-web'],
  }

  service { 'logstash-web':
    ensure   => running,
    provider => 'upstart',
    require  => File['/etc/init/logstash-web.conf'],
  }

}
