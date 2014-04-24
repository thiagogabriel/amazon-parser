#!/usr/bin/env ruby
require_relative '../lib/product'

loop {
  puts "\nAdd an amazon url to be crawled or type 'exit' to leave."
  input = gets.chomp
  break if input == 'exit'

  product = Product.new(input)
  puts product.formatted_output
}
