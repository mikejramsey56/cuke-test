require 'json'
require 'httparty'
require 'rspec/expectations'
require 'pathname'

When(/^I create a veggie:$/) do |table|
  @parm_body = table.rows_hash
  puts "@parm_body: " + @parm_body.to_s
end

When(/^I send that create request to "(.+)"$/) do |a_url|
  @response = HTTParty.post(a_url,
    { 
      :body => [ @parm_body ].to_json,
      :headers => { 'Content-Type' => 'application/json', 'Accept' => 'application/json'}
    })
  expect(@response.success?).to be true
end

Then(/^the response status should be "(.+)"$/) do |resp_code|
  puts "response code: " + @response.code.to_s
  expect(@response.code.to_s).to eq(resp_code)
  puts "response headers: " + @response.headers.to_s
  puts "response body: " + @response.body.to_s

  main_response = JSON.parse(@response.body)

  main_response = extractResponseBodySansId(main_response[0])
  expect(main_response).to eq(@parm_body)
end

Then(/^I save the retrival id for later$/) do
  targetDir = File.join(File.dirname(__FILE__), '..', 'target' )
  open(targetDir + "/veggies", 'w') { |f1|
    f1.puts "#{@response_id}"
    f1.close
  }

end

Given(/^I know the last veggie I created$/) do
  targetDir = File.join(File.dirname(__FILE__), '..', 'target' )
  f = File.open(targetDir + "/veggies", 'r')
  f.each_line do |line|
    @response_id = line.to_i
    puts "#{@response_id}"
    f.close
    break
  end
end

When(/^I send that retrieve request to "([^"]*)"$/) do |a_url|
  puts "get url: " + a_url + "/" + "#{@response_id}"
  @response = HTTParty.get(a_url + "/" + "#{@response_id}",
    { 
      :headers => { 'Accept' => 'application/json'}
    })
  expect(@response.success?).to be true
end

Then(/^the retrieved properties are:$/) do |table|
  puts "response code: " + @response.code.to_s
  puts "response headers: " + @response.headers.to_s
  puts "response body: " + @response_body.to_s

  main_response = JSON.parse(@response.body)

  main_response = extractResponseBodySansId(main_response)
  expect(main_response).to eq(table.rows_hash)
end

Then(/^the retrieve response status should be "(.+)"$/) do |resp_code|
  puts "response code: " + @response.code.to_s
  puts "response headers: " + @response.headers.to_s
  puts "response body: " + @response.body.to_s
  expect(@response.code.to_s).to eq(resp_code)
end

def extractResponseBodySansId(main_response)
  expect(main_response.key?("id")).to be true
  @response_id = main_response["id"]
  puts "response id=" + "#{@response_id}"

  main_response.delete("id") # id added by server
  
  main_response.each { |k, v| main_response.store(k, v.to_s) } # Need to be able to compare str to str
end

