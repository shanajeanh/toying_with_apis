require "net/http"
require "json"
require 'dotenv'
Dotenv.load

key = ENV["NEWS_API_KEY"]
sources = URI('https://newsapi.org/v1/sources?language=en')
source_response = Net::HTTP.get_response(sources)
news_sources = JSON.parse(source_response.body)

# source_array = []
#
# news_sources["sources"].each do |ns|
#   source_array << ns["id"]
# end


uri = URI("https://newsapi.org/v1/articles?source=the-new-york-times&apiKey=#{key}")
response = Net::HTTP.get_response(uri)
news_stuff = JSON.parse(response.body)

news_stuff['articles'].each do |article|
  puts "#{article["title"]} by #{article["author"]}"
end
