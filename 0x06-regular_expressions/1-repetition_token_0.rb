#!/usr/bin/env ruby
#this regular expression using ruby script that accept one argument#and pass it to aregular expression.

puts ARGV[0].scan(/hbt{2,5}n/).join
