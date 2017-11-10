Feature: User Login

Scenario: Valid
  Given We navigate to the login page
  When We fill valid credentials
  Then The dashboard will be displayed

Scenario: Invalid email
  Given We navigate to the login page
  And We enter invalid email and correct password
  Then We should see error

Scenario: Invalid password
  Given We navigate to the login page
  And We enter correct email and invalid password
  Then We should see error

Scenario: Invalid email and password
  Given We navigate to the login page
  And We enter incorrect email and password
  Then We should see error
