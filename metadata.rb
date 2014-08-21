name             'simple_firewall'
maintainer       'Boye Holden'
maintainer_email 'boye.holden@hist.no'
license          'Apache 2.0'
description      'A super simple IPTABLES firewall cookbook'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

recipe 'simple_firewall', 'Enables a basic firewall used with templates'
recipe 'simple_firewall::disable', 'Disables the basic firewall'

%w(ubuntu debian).each do |os|
  supports os
end