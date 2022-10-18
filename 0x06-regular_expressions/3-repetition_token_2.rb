#!/usr/bin/env ruby
#this ruby script accepts one argument and pas it to a regular expression matching method.

puts ARGV[0].scan(/hbt+n/).join
