Exec {
  path => ["/usr/bin", "/bin", "/usr/sbin", "/sbin", "/usr/local/bin", "/usr/local/sbin"]
}

exec { 'apt-get update':
  command => '/usr/bin/apt-get update'
}

$packages = [
  # frontend
  'nodejs-legacy',
  'npm',
  # python
  'python-pip',
  'python3-dev'
]

# install packages
package { $packages:
  ensure => present,
  require => Exec["apt-get update"]
}

exec { 'venv':
	command => '/usr/bin/pip install virtualenv'
}
