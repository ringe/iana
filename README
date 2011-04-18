== What
IANA Ruby module version 1.1.0
https://yesmar.github.com/iana/

I like to look stuff up, like TCP/IP port numbers, protocols, top-level
domains, et al. I get my data from the Internet Assigned Numbers Authority
(IANA) and like to make it available to my programs. Since I am open sourcing
this code you can add this functionality to your own programs as well.

== How
require 'iana'

The IANA Ruby module loads the data into conveniently searchable data
structures. The flat files the IANA Ruby module consume as data are hosted at
iana.org. You will need to fetch them so you can process the content locally.
I grab these files with with curl (but you can use wget or whatever if you
don't use curl):

curl -L -O http://www.iana.org/assignments/port-numbers
curl -L -O http://www.iana.org/assignments/protocol-numbers/protocol-numbers.xml
curl -L -O http://data.iana.org/TLD/tlds-alpha-by-domain.txt
curl -L -O http://www.iana.org/assignments/ethernet-numbers

== Install
Installation is super easy!

rake manifest
rake gem
sudo gem install/pkg/iana-1.1.0.gem

That's it. See the programs in the examples directory to see how to use the
IANA gem.

== Examples
When you run the example programs, do it like so:

  ruby examples/ports.rb port-numbers

Use these example programs to see how you might use and otherwise integrate
IANA data functionality into your own programs.

== Notes
Version 2.0 is a planed rewrite from scratch. Most outstanding usability
issues will be addressed in this release. I will be adding some additional
functionality to simplify using these scripts in code generators.

== Contribute
The source is availble at github: git://github.com/yesmar/iana.git. Feel free
to clone it and implement your own awesome ideas. You can also send your
patches by email to yesmar[at]gmail[dot]com.
