Feature: User sign in
  In order to use the Application
  As a user
  I want to Sign In with valid details

  Background:
    Given I am not logged in
    When I visit user sign in screen

  Scenario: Sign in form available
     Then I should see sign in form

  Scenario Outline: Sign in with invalid credentials
    Given I already have a valid account
    When I login with "<email>", "<password>"
    Then I should see "<error_message>"

    Examples:
    | test_for       | email | password                | error_message |
    | No Account     | no_account@email.com | password | Invalid email or password |
    | Valid Email    | joh | password                  | Invalid email or password |
    | Blank Password | rohit123@gmail.com |               | Invalid email or password |
    | Wrong Password | rohit1234@gmail.com | wrong_password| Invalid email or password |

  Scenario: Sign in with valid credentials
    Given I already have a valid account
    When I login with "rohit@gmail.com", "password"
    Then I am redirected to dashboard screen
    And I should see success message

