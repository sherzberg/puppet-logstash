class logstash::web (
  $elasticsearch_backend = "elasticsearch:///?local"
) {

  file { '/etc/init/logstash-web.conf':
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('logstash/logstash-web-upstart.erb'),
  }

  service { 'logstash-web':
    ensure    => running,
    provider => 'upstart',
    subscribe => [
      File['/etc/init/logstash-web.conf'],
    ]
  }

}
