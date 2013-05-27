require 'rubygems'
require 'selenium-webdriver'

driver = Selenium::WebDriver.for :firefox
wait = Selenium::WebDriver::Wait.new()

driver.get "http://localhost:3000"
#wait.until {driver.find_element(:link_text, "Log In")}
element=driver.find_element(:link_text, "Log In")
element.click

#wait.until { driver.find_element :id => "user_email" }
element = driver.find_element :id => "user_email"
element.send_keys "testdata@gmail.com"

element = driver.find_element :id =>"user_password"
element.send_keys "testdata"
element.submit

puts "Page title is #{driver.title}"

wait.until{driver.get "http://localhost:3000/courses"}
puts "Page title is #{driver.title}"

 #driver.get "http://localhost:3000/users/sign_out"
# driver.quit