require 'faraday'
require 'Oj'

client = Faraday.new(url: 'http://localhost:3000') do |config|
  config.adapter Faraday.default_adapter
  config.token_auth('2bbe5434d2ffca87d02af18db66c36a7')
end

response = client.delete do |req|
  req.url '/api/v1/posts/1'
  req.headers['Content-Type'] = 'application/json'
end

puts Oj.load(response.body)
puts response.status
