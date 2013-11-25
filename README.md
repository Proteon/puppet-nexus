puppet-nexus
============

Puppet code for deploying and configuring Nexus (Sonatype) on Tomcat

Dependencies:

    'proteon/tomcat', '>=0.1.15'

Configure an instance
-------------------------
To create an instance of a nexus installation, keep in mind that if you specify RELEASE / LATEST as version for the instance it will break your upgrade process.

    nexus::instance { 'nexus_1': 
        version => '2.7.0-m4',
    }
    
Customize the tomcat installation
---------------------------------
To customize the settings of the tomcat installation create your own instance of tomcat and use that for the nexus instance (the resource names have to match).

    tomcat::instance { 'nexus_1': 
        java_version => 'oracle_1_7_0',
        max_heap     => '4096m',
    }
    
    nexus::instance { 'nexus_1': 
        version => '2.6.4-02',
    }
    
For more advanced configuration see the proteon/tomcat module

Upgrading the nexus installation
--------------------------------
Upgrading and downgrading should be as easy as changing the version number, the proteon/tomcat module will clean up your old ROOT and clear out the temp/work directories for you.
