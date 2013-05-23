require 'rubygems'
require 'selenium-webdriver'

driver = Selenium::WebDriver.for :firefox


driver.get "http://localhost:3000/users/sign_in"

wait = Selenium::WebDriver::Wait.new(:timeout => 10)
wait.until { driver.find_element :id => "user_email" }

element = driver.find_element :id => "user_email"
element.send_keys "testdata@gmail.com"

element = driver.find_element :id =>"user_password"
element.send_keys "testdata"
element.submit

puts "Page title is #{driver.title}"

wait = Selenium::WebDriver::Wait.new(:timeout => 10)
wait.until { driver.title.downcase.start_with? "beacon!" }

puts "Page title is #{driver.title}"
driver.quit