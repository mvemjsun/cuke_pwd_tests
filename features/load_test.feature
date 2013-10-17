@load_test
Feature: Changing MOTCOMP passwords using the internet password change portal with many users.

  when many users try to use the password change portal to change the password
  the site should respond and the users should be able to change their passwords
  with success.

  @user1
  Scenario: Trying to identify a user1
    When I try to login as user ABBE0001
    Then I should see a page with text "Provide details to change password for User ID"

  @user2
  Scenario: Trying to identify a user2
    When I try to login as user ABBE0002
    Then I should see a page with text "Provide details to change password for User ID"

  @user3
  Scenario: Trying to identify a user3
    When I try to login as user ABBE0003
    Then I should see a page with text "Provide details to change password for User ID"

  @user4
  Scenario: Trying to identify a user4
    When I try to login as user ABBO0002
    Then I should see a page with text "Provide details to change password for User ID"

  @user5
  Scenario: Trying to identify a user5
    When I try to login as user ABBO0003
    Then I should see a page with text "Provide details to change password for User ID"

  @user6
  Scenario: Trying to identify a user6
    When I try to login as user ABBO0005
    Then I should see a page with text "Provide details to change password for User ID"

  @user7
  Scenario: Trying to identify a user7
    When I try to login as user ABBO0009
    Then I should see a page with text "Provide details to change password for User ID"

  @user8
  Scenario: Trying to identify a user8
    When I try to login as user ABBO0012
    Then I should see a page with text "Provide details to change password for User ID"

  @user9
  Scenario: Trying to identify a user9
    When I try to login as user ABBO0015
    Then I should see a page with text "Provide details to change password for User ID"

  @user10
  Scenario: Trying to identify a user10
    When I try to login as user ABCD0001
    Then I should see a page with text "Provide details to change password for User ID"