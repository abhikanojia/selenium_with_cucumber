Given("We navigate to the login page") do
 @page ||= Login.new
 @page.visit("http://ec2-52-15-34-101.us-east-2.compute.amazonaws.com/users/sign_in")
end

When("We fill valid credentials") do
  @page.fill_input_by_id('user_email', 'abhishek.kanojia+1@vinsol.com')
  @page.fill_input_by_id('user_password', '1111111')
  @page.click_button('submit')
end

Then("The dashboard will be displayed") do
  wait = Selenium::WebDriver::Wait.new(:timeout => 10)
  element = wait.until { @page.driver.find_element(:class => "positive") }
  expect(element.text).to eq('Signed in successfully.')
end

When("We enter invalid email and correct password") do
  @page.fill_input_by_id('user_email', 'asd')
  @page.fill_input_by_id('user_password', '1111111')
  @page.click_button('submit')
end

When("We enter correct email and invalid password") do
  @page.fill_input_by_id('user_email', 'abhishek.kanojia+1@vinsol.com')
  @page.fill_input_by_id('user_password', '11')
  @page.click_button('submit')
end

When("We enter incorrect email and password") do
  @page.fill_input_by_id('user_email', 'asd')
  @page.fill_input_by_id('user_password', '11')
  @page.click_button('submit')
end

Then("We should see error") do
  wait = Selenium::WebDriver::Wait.new(:timeout => 10)
  element = wait.until { @page.driver.find_element(:class => "negative") }
  expect(element.text).to eq('Invalid Email or password.')
end