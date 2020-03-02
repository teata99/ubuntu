1:7.6p1-4ubuntu0.3

class sshd {

   package { 'openssh-server':
       ensure => '1:7.6p1-4ubuntu0.3',
   }

   service { 'ssh':
   ensure => running,
   subscribe => File[‘sshdconfig’],
         require => Package['openssh-server'],
   }

  file { 'sshdconfig':
        name => '/etc/ssh/sshd_config',
        owner => root,
        group => root,
        mode => 644,
        source => 'puppet:///modules/sshd/sshd_config',
        require => Package['openssh-server'],
  notify => Service['ssh'],
  }

  file { '/home/ubuntu/.ssh/authorized_keys':
  owner => ubuntu,
  group => ubuntu,
  mode => 600,
  }

}
