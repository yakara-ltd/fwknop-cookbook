fwknopf Cookbook
================
cookbook for fwknop

Requirements
------------

#### Operating System
Tested on Debian, should work on RHEL/CentOS

#### packages
- `sysctl` - for enabling ip forwarding

Attributes
----------
TODO: List your cookbook attributes here.

e.g.
#### fwknop::server
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['fwknop-cookbook']['site']</tt></td>
    <td>String</td>
    <td>The site name (e.g. 'site23') - use 'test' for testing</td>
    <td><tt>true</tt></td>
  </tr>
  <tr>
    <td><tt>['fwknop-cookbook']['server']</tt></td>
    <td>String</td>
    <td>The server to connect to</td>
    <td><tt>true</tt></td>
  </tr>
</table>

Usage
-----
#### fwknop-cookbook::server

Contributing
------------
TODO: (optional) If this is a public cookbook, detail the process for contributing. If this is a private cookbook, remove this section.

e.g.
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Authors: TODO: List authors
