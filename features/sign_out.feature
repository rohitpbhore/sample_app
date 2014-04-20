Feature: User sign out
  In order to maintain the security of Application
  As a user
  I want sign out of my Account

  Scenario: Sign out of the application
    Given I am already logged in
    When I sign out of the application
    Then I should be redirected to dashboard screen
    And I should see message "Signed out successfully"
    When I visit new post path
    Then I should be redirected to sign in screen
    And I should see message "You need to sign in or sign up before continuing."
