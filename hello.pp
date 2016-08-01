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


file { 'lol':
    path => '/home/banjocat/tuts/puppet-tut/lol',
    ensure => 'directory',
    owner => 'banjocat',
    group => 'banjocat',
    mode => '0644',
}

file {'pizza.log':
    path => '/home/banjocat/tuts/puppet-tut/lol/pizza.log',
    require => File['lol'],
    content => "This is the pizza log!
    It has a log of all the pizzas.
    There are none here yet.
    "
}
->
file {'pizza-link':
    path => '/home/banjocat/tuts/puppet-tut/lol/pizza-link.log',
    ensure => 'link',
    target => '/home/banjocat/tuts/puppet-tut/lol',
}

user { 'banjocat':
    ensure => 'present',
    home => '/home/banjocat',
    managehome => true,
    groups => [ 'banjocat', 'adm', 'cdrom', 'sudo', 'dip', 'plugdev', 'lpadmin', 'sambashare', 'docker' ],
    shell => '/bin/bash',
}

exec { 'other.log':
    command => 'touch other.log',
    provider => 'shell',
    cwd => '/home/banjocat/tuts/puppet-tut/lol/',
    creates => '/home/banjocat/tuts/puppet-tut/lol/other.log',
    require => File['lol']
}
    
