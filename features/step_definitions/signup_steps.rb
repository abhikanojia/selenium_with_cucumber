Given("We navigate to the signup page") do
 @page ||= SignUp.new
 @page.visit("http://ec2-52-15-34-101.us-east-2.compute.amazonaws.com/users/sign_up")
end


# All Valid
When("We fill all valid details") do
  email = "abhishek.kanojia".random_email
  password = String::password
  @page.fill do |el|
    el.input_by_id('user_first_name', 'Abhishek')
    el.input_by_id('user_last_name', 'Kanojia')
    el.input_by_id('user_email', email)
    el.input_by_id('user_password', password)
    el.input_by_id('user_password_confirmation', password)
  end
  @page.click_button('submit')
end

# Assertion
Then("The message will be displayed for confirming email") do
  msg = 'Thank you for signing up on Jumpsure. A message with a confirmation link has been sent to your email address. Please follow the link to activate your account.'
  wait = Selenium::WebDriver::Wait.new(:timeout => 10)
  element = wait.until { @page.driver.find_element(:class => "positive") }
  expect(element.text).to eq(msg)
end


# Invalid Firstname
When("We fill all valid details with invalid firstname") do
  email = "abhishek.kanojia".random_email
  password = String::password
  @page.fill do |el|
    el.input_by_id('user_first_name', ' ')
    el.input_by_id('user_last_name', 'Kanojia')
    el.input_by_id('user_email', email)
    el.input_by_id('user_password', password)
    el.input_by_id('user_password_confirmation', password)
  end
  @page.click_button('submit')
end


# Invalid Lastname
When("We fill all valid details with invalid lastname") do
  email = "abhishek.kanojia".random_email
  password = String::password
  @page.fill do |el|
    el.input_by_id('user_first_name', 'Abhishek')
    el.input_by_id('user_last_name', ' ')
    el.input_by_id('user_email', email)
    el.input_by_id('user_password', password)
    el.input_by_id('user_password_confirmation', password)
  end
  @page.click_button('submit')
end


# Invalid Email
When("We fill all valid details with invalid email") do
  email = String::invalid_email
  password = String::password
  @page.fill do |el|
    el.input_by_id('user_first_name', 'Abhishek')
    el.input_by_id('user_last_name', 'Kanojia')
    el.input_by_id('user_email', email)
    el.input_by_id('user_password', password)
    el.input_by_id('user_password_confirmation', password)
  end
  @page.click_button('submit')
end


# Invalid Password
When("We fill all valid details with invalid password") do
  email = String::invalid_email
  password = '1111'
  @page.fill do |el|
    el.input_by_id('user_first_name', 'Abhishek')
    el.input_by_id('user_last_name', 'Kanojia')
    el.input_by_id('user_email', email)
    el.input_by_id('user_password', password)
    el.input_by_id('user_password_confirmation', password)
  end
  @page.click_button('submit')
end

# Unmatched Password and Password confirmation
When("We fill all valid details with password and confirmation unmatched") do
  email = 'abhishek.kanojia'.random_email
  password = '1111111'
  @page.fill do |el|
    el.input_by_id('user_first_name', 'Abhishek')
    el.input_by_id('user_last_name', 'Kanojia')
    el.input_by_id('user_email', email)
    el.input_by_id('user_password', password)
    el.input_by_id('user_password_confirmation', 'password')
  end
  @page.click_button('submit')
end

# Assertion Error
Then("The error message will be displayed") do
  msg = 'Please review the problems below:'
  wait = Selenium::WebDriver::Wait.new(:timeout => 10)
  element = wait.until { @page.driver.find_element(:class => "alert-error") }
  expect(element.text).to eq(msg)
end