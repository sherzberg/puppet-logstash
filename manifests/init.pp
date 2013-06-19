# Class logstash
#
# Common class for logstash.
#
class logstash inherits logstash::params {
  include stdlib
  include java

  file {
    $logstash::params::bin_dir: ensure => directory;
    $logstash::params::etc_dir: ensure => directory;
    $logstash::params::log_dir: ensure => directory;
    $logstash::params::run_dir: ensure => directory;
  }

  exec { 'download logstash jar':
    command => "wget ${logstash::params::source}",
    path    => ['/usr/bin'],
    cwd     => $logstash::params::bin_dir,
    timeout => 0,
    require => File[$logstash::params::bin_dir],
    creates => $logstash::params::bin_file,
  }

}
