## What
IANA Ruby module version 1.1.3

Look up TCP/IP port numbers, protocols, top-level domains, et al.

Get data from the Internet Assigned Numbers Authority (IANA) and make it
available to your programs.

## Install

    gem install iana-data

In your Gemfile

    gem 'iana-data'

## Usage

```ruby
  require 'iana'
```

The IANA Ruby module loads the data into conveniently searchable data
structures. The flat files the IANA Ruby module consume as data are hosted at
iana.org. You will need to fetch them so you can process the content locally.
I grab these files with with curl (but you can use wget or whatever if you
don't use curl):

    curl -L -O http://www.iana.org/assignments/port-numbers
    curl -L -O http://www.iana.org/assignments/protocol-numbers/protocol-numbers.xml
    curl -L -O http://www.iana.org/assignments/ethernet-numbers

TLD data is downloaded automatically using open-uri, so no need to fetch yourself.

## Examples
When you run the example programs, do it like so:

    ruby examples/ports.rb port-numbers

Use these example programs to see how you might use and otherwise integrate
IANA data functionality into your own programs.

## Contribute
The source is availble at https://github.com/ringe/iana

Fork, patch and send a pull request.
