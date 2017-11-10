Feature: SignUp User

Scenario: Valid Details
  Given We navigate to the signup page
  When We fill all valid details
  Then The message will be displayed for confirming email

Scenario: Invalid Firstname
  Given We navigate to the signup page
  When We fill all valid details with invalid firstname
  Then The error message will be displayed

Scenario: Invalid Lastname
  Given We navigate to the signup page
  When We fill all valid details with invalid lastname
  Then The error message will be displayed

Scenario: Invalid Email
  Given We navigate to the signup page
  When We fill all valid details with invalid email
  Then The error message will be displayed

Scenario: Invalid Password
  Given We navigate to the signup page
  When We fill all valid details with invalid password
  Then The error message will be displayed

Scenario: Password and Confirmation are not same
  Given We navigate to the signup page
  When We fill all valid details with password and confirmation unmatched
  Then The error message will be displayed