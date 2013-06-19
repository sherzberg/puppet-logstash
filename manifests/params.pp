# Class: logstash::params
#
# Sets internal variables and defaults for the logstash module.
# This class is automatically loaded into classes that uses values set here.
class logstash::params (
  $base_url = 'http://semicomplete.com/files/logstash',
  $layout = 'monolithic',
  $version = '1.1.12' ) {
  $bin_dir = '/opt/logtash'
  $etc_dir = '/etc/logstash'
  $log_dir = '/var/log/logstash'
  $run_dir = '/var/run/logstash'
  $jar_file = "logstash-${version}-${layout}.jar"
  $source   = "$base_url/${jar_file}"
  $bin_file = "${bin_dir}/${jar_file}"
}
