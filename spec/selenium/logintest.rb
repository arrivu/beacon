require 'rubygems'
require 'selenium-webdriver'
describe "Login" do

   before(:all) do
    @verification_errors = []

    @browser = Selenium::Client::Driver.new(
      :host => "localhost",
      :port => 4444,
      :browser => "*firefox",
      :url => "http://localhost:3000/users/sign_in",
      :timeout_in_second => 90)

    @browser.start
  end
  it "should login with valid username and password" do
    @browser.open "http://localhost:3000/users/sign_in"
    @browser.type "userName", "testdata@gmail.com"
    @browser.type "css=form > table > tbody > tr:nth(1) > td:nth(1) > #password", "testdata"
    @browser.click "submit", :wait_for => :page
    assert @browser.is_text_present("Hello, testdata")
  end
 end
 