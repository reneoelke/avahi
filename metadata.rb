maintainer        "foobugs Oelke & Eichner GbR"
maintainer_email  "rene.oelke@foobugs.com"
license           "Apache 2.0"
description       "Installs and configures avahi daemon."
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version           "1.1.5"
name              "avahi"

recipe            "default", "Common installation and configuration."
recipe            "aliases", "Common installation and configuration for avahi aliases."

%w{ ubuntu }.each do |os|
  supports os
end
