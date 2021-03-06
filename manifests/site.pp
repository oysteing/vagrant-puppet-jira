node default {

  include apt
  exec { "$oracle-java8-installer-accepted-oracle-license-v1-1":
    command => "/bin/echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/sudo /usr/bin/debconf-set-selections",
    unless  => "/usr/bin/debconf-show oracle-java8-installer | grep 'shared/accepted-oracle-license-v1-1: true'",
  } ->
  apt::ppa { 'ppa:webupd8team/java': } ->
  package { ['oracle-java8-installer', 'oracle-java8-set-default']:
    before => Service['jira'],
  }

  class { 'jira':
    javahome    => '/usr/lib/jvm/java-8-oracle',
    version     => '6.4.2',
  }

  class { 'postgresql::server': }

  postgresql::server::db { 'jira':
    user     => 'jiraadm',
    password => postgresql_password('jiraadm', $jira::dbpassword),
  }

}
