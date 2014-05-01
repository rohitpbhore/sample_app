Feature: CRUD Post
  In order to use the Application
  As a user
  I want to perform CRUD operations with valid details

  Background:
    Given I am logged in
    Given I already have a valid post

  Scenario Outline: Create post with valid/invalid data
    When I visit create post screen
    # Given I open page in browser
    Then I should see create post form
    And I fill in "<title>", "<content>"
    Then I should see "<message>"

    Examples:
    | test_for | title | content | message |
    | Nil title |  | content meggages | Title can't be blank |
    | Nil content | title1 | | Description can't be blank |
    | Valid data | title2 | content meggages | Post was successfully created. |


  Scenario Outline: Edit post with valid/invalid data
    When I visit edit post screen
    Then I should see edit post form
    And I fill in "<title>", "<content>"
    Then I should see "<message>"

    Examples:
    | test_for | title | content | message |
    | Nil title |  | content meggages | Title can't be blank |
    | Nil content | title1 | | Description can't be blank |
    | Valid data | title2 | content meggages | Post was successfully updated. |


  Scenario: Delete valid post
    When I visit dashboard
    Then I should see post
    And I delete post
    Then I should not see post
