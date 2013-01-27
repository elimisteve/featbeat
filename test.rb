#!/usr/bin/env ruby
require 'treat' 
include Treat::Core::DSL

s = sentence('An uninteresting sentence, yes it is.')
s.parse
