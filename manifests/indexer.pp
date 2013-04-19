# Class: logstash::indexer
class logstash::indexer (
  $workers         = 1,
  $config_template = 'logstash/indexer.conf.erb',
  $web_backend     = 'elasticsearch:///?local'
) {
  require logstash::params
  require logstash
  $conf = '/etc/logstash/indexer'
  $process_name = 'indexer'

  file { "$logstash::params::etc_dir/indexer.conf":
    ensure  => present,
    content  => template($config_template),
  }

  file { '/etc/init/logstash-indexer.conf':
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('logstash/logstash-indexer-upstart.erb'),
  }

  service { 'logstash-indexer':
    ensure    => running,
    subscribe => [
      File["$logstash::params::etc_dir/indexer.conf"],
    ]
  }

}
