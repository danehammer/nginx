nginx Cookbook
==============
This cookbook installs Nginx, configures it to listen on port 8000 and display the [Puppet Labs Sample Webpage](https://raw.githubusercontent.com/puppetlabs/exercise-webpage/master/index.html).

Requirements
------------
CentOS ~> 7.1 or Ubuntu ~> 14.04

Chef ~> 12

Attributes
----------
Key|Description|Default|Type|
----|-----------|-------|---|
['nginx']['datadir']| Directory Nginx reads from| /data/www/ | String
['nginx']['port']|  Default port to listen on |8000 | String
['nginx']['user']|  User to run Nginx as|nginx | String

Usage
-----
This cookbook can be run successfully without an additional role or environment configuration. All that's needed is to upload the cookbook to the Chef Server, apply the recipe to the run_list and run chef-client.

Testing
-----

This Cookbook contains integration tests to simulate the deployment of Nginx to Ubuntu and CentOS nodes.

To run the tests, do the following

````
git clone github.com/cullenmcdermott/nginx && cd nginx
gem install bundler
bundle install
kitchen test
# If you would like to login and interogate VMs after convergance, use 'kitchen converge' instead.
````
test-kitchen will forward the ports to port 8000 and 8001 on your host machine and can be accessed via the browser at http://localhost:8000 and http://localhost:8001.
