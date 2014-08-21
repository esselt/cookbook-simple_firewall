Description
===========

Installs the IPTABLES package if it not already is installend, and
uses a template to make a simple firewall the possibility to add our
own firewall rules. The firewall manages the templates to
/etc/network/if-{pre-up,post-down}.d/simple_firewall and runs the up
script if the template is modified.

Firewall defaults to DROP input and ACCEPT output.

Requirements
============

Chef version 11.0+

## Platform

Supported platforms by platform family:

* debian (debian, ubuntu)

Attributes
==========

* `node['simple_firewall']['rules']` - The additional rules

Usage
=====

## simple_firewall::default

Will manage the firewall templates and add these to the machine.
It handles both IPv4 and IPv6 rules. And all rules are run
unmodified straight to iptables (IPv4) or ip6tables (IPv6)

Example role

    name 'myclient'
    run_list(
      'recipe[simple_firewall]'
    )
    default_attributes(
      'simple_firewall' => {
        'rules' => {
          100 => {
            'name' => 'Allow SSH',
            'rule' => '-A INPUT -p tcp --dport 22 -m state --state NEW,ESTABLISHED -j ACCEPT'
            'rule6' => '-A INPUT -p tcp --dport 22 -m state --state NEW,ESTABLISHED -j ACCEPT'
          }
        }
      }
    )

## simple_firewall::disable

Will run the post-down script and then remove both scripts.

License and Authors
===================
Author:: Boye Holden (<boye.holden@hist.no>)

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
