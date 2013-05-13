# Class: logstash::params
#
# Sets internal variables and defaults for the logstash module.
# This class is automatically loaded into classes that uses values set here.
class logstash::params {
  $bin_dir = '/opt/logtash'
  $etc_dir = '/etc/logstash'
  $log_dir = '/var/log/logstash'
  $run_dir = '/var/run/logstash'
  $version = '1.1.12'
  $jar_file = "logstash-${version}-monolithic.jar"
  $source   = "http://semicomplete.com/files/logstash/${jar_file}"
  $bin_file = "${bin_dir}/${jar_file}"
}
