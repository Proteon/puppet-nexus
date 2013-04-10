# == Resource: nexus::instance
#
# === Parameters
#
# [*instance*]  The instance this nexus should be installed in (see tomcat::instance). This instance will be created if not defined
# separatly.
# [*version*]   The version of nexus to install (maven artifact version).
#
# === Variables
#
# === Examples
#
#  nexus::instance { 'nexus_1':
#    instance => 'tomcat_1',
#    version  => '2.3.1-01',
#  }
#
# === Authors
#
# Sander Bilo <sander@proteon.nl>
#
# === Copyright
#
# Copyright 2013 Proteon.
#
define nexus::instance ($instance = $name, $version = 'LATEST') {
    if (!defined(Tomcat::Instance[$instance])) {
        tomcat::instance { $instance: }
    }

    tomcat::webapp::maven { 'ROOT':
        instance   => $instance,
        groupid    => 'org.sonatype.nexus',
        artifactid => 'nexus-webapp',
        version    => $version,
    }
}