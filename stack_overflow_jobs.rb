require 'rubygems'
require 'nokogiri'
require 'open-uri'
#README
# search on careers.stackoverflow.com
# url = url of the first page
# change 10 to number of pages in results
# i = current page number
# outputs to stdout

(1..10).to_a.each do |i|
  url = "http://careers.stackoverflow.com/jobs?searchTerm=mobile+developer&location=united+kingdom&range=20&distanceUnits=Miles&sort=s&pg=#{i}"

  site = 'http://careers.stackoverflow.com'

  doc = Nokogiri::HTML(open(url))

  doc.css('.-title > .job-link').each do |item|
    puts "#{site}#{item[:href]}"
  end
end
