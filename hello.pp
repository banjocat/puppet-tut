# hello.pp

$person = "Cassie"
$time = "night"

if $time == "day" {
    notify { "Hello $person": }
}
elsif $time == "night" {
    notify { "Goodbye $person": }
}
else  {
    notify { "Unknown message for $person":}
}
service { 'puppet':
    ensure => 'stopped',
    enable => 'false'
}


package { 'docker':
    ensure => 'installed'
}

service { 'docker':
    ensure => 'running',
    require => Package['docker']
}

package { 'apache2':
    ensure => 'installed'
}



