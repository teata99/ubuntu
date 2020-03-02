
class sys_info {
    package { 'gkrellm' :
        ensure => '2.3.10-1',
    }

    exec { 'gkrellm' :
        command => '/usr/bin/gkrellm &',
        require => Package['gkrellm'],
    }
}

