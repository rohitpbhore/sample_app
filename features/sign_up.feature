Feature: New User Sign Up
  In order to get access to the Application
  As a User
  I want to Sign Up with valid details

  Background:
    Given I am not logged in
    When I go to signup screen

  Scenario: Sigup form available
     Then I should see signup form

  Scenario Outline: Sign up with valid/invalid data
    When I fill in "<username>", "<email>", "<password>", "<password_confirmation>"
    Then I should see "<message>"

    Examples:
    | test_for | username | email | password | password_confirmation | message |
    | Valid Email | Johnn | wrong_email | correct_password | correct_password | Email is invalid |
    | Valid Email | John0 | | correct_password | correct_password | Email can't be blank |
    | Valid Password | John1 | correct@email.com | wp | wp | too short |
    | Valid Password | John12 | correct12@email.com | wrong_password |  | Password confirmation doesn't match |

  Scenario: Sign up with already registered email id
    Given I am already registered in the system with email "email123@ghhg.bh"
    When I sign up with same email id "email123@ghhg.bh"
    Then I should see error message "has already been taken"

  Scenario: Sign up with valid data
    When I sign up with valid data
    Then I am redirected to dashboard
    And I should see welcome message "Welcome! You have signed up successfully"
