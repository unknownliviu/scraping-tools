require 'rubygems'
require 'nokogiri'
require 'open-uri'

pages = 2
site = 'http://www.gumtree.com'
output_file = "#{site.gsub('http://', '')} leads #{Time.now.to_i}.txt"
results = []


(1..pages).each do |index|
  url = "http://www.gumtree.com/software-development-jobs/uk/mobile/page#{index}?search_scope=true"
  doc = Nokogiri::HTML(open(url))
  doc.css('.listing-link').each do |item|
    puts "#{site}#{item[:href]}"
    results << "#{site}#{item[:href]}"
  end

end
file =  File.open(output_file, 'w') do |f|
  results.each do |item|
    f.puts(item)
  end
end
