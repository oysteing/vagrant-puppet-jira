vagrant-puppet-jira
===================

Install JIRA on Ubuntu 14.04 using Vagrant and Puppet

Install
-------
Add a Hiera file `hiera/credentials.yaml` with the database password. Example:
```yaml
jira::dbpassword: examplepass
```

```sh
$ sudo apt-get install librarian-puppet
$ librarian-puppet install
vagrant up
```

Rerun Puppet from inside the guest with `sudo puppet apply --modulepath /vagrant/modules --hiera_config /vagrant/hiera.yaml /vagrant/manifests/site.pp`

License
-------
The MIT License (MIT)

Author
------------
* Merritt Krakowitzer merritt@krakowitzer.com
* Øystein gisnås oystein@gisnas.net
