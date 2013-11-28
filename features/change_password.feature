@normal
Feature: Changing MOTCOMP passwords using the internet password change portal.

 As a MOTCOMP smartcard holder
 I want to change my password using the password portal
 So that I dont need to call up the service desk.

    @test
  Scenario: User trying to use the website and providing userid whose format is invalid
      When I supply a userid whose format is invalid
      Then I should see an error message "Your request could not be processed"
      And the page title should be correct

  Scenario: User trying to use the portal too many times
      When A user tries to use the password portal too many times to change his password
      Then I should see an error message "You are not allowed to change the password currently as you have exceeded the number of attempts"

  Scenario: User trying to use the website and providing no userid
      When I dont supply a userid
      Then I should see an error message "Your request could not be processed"

  Scenario: A valid user format supplied on identify page then next screen to be presented
      When I visit the portal and supply a correctly formatted unknown userid
      Then I should see a page with text "Provide details to change password"

  Scenario: Valid formatted used ID should present the user with a set of 3 questions
      Given I visit the portal and supply a correctly formatted unknown userid
      Then I should see a page with text "Provide details to change password"
    And the password confirmation page should have 3 questions presented to the user

  Scenario: A valid formatted user should be presented with correctly formatted answer characters (no 0 position)
    Given I visit the portal and supply a correctly formatted unknown userid
    Then I should be presented with 3 security questions having valid character positions
    And the page title should be correct

  Scenario: An use of portal to identify the user should create a password attempt log
    Given I visit the portal and supply a correctly formatted unknown userid
    Then an entry should be created in the table passwordattemptlog for the password attempt
    And the attempt count in table passwordattemptlog should be set to 0

  Scenario: An use of portal to change password should set the attempt count
    Given I visit the portal and supply a correctly formatted unknown userid
    Then I answer the security questions for valid unknown user
    And I try to change the password
    Then the attempt count in table passwordattemptlog should be set to 1
    And no entry should be created in table securitylog

  Scenario: Multiple failed attempts to change the password should increment the attempt count.
    Given I visit the portal and supply a correctly formatted unknown userid
    Then I answer the security questions for valid unknown user
    When I try to change my password 4 times
    Then the attempt count in table passwordattemptlog should be set to 4
    
    @retry
  Scenario: Successful change of password should set the security log status to success
    Given I visit the portal and supply a correctly formatted known userid
    Then I answer the security questions correctly for valid user
    And I should be able to change the password with success
    And the page title should be correct
    Then the change result of the table securitylog should be set to successful
    And the attempt count in table passwordattemptlog should be set to 1
    
  Scenario: Storing the security log correctly for valid and known user. The random questions presented should
    be stored correctly, i.e the questions and their answer characters should be saved correctly.
    Given I visit the portal and supply a correctly formatted known userid
    When I answer the security questions correctly for valid user
    Then questions presented should be stored correctly in table securitylog
    And I should be able to change the password with success

  Scenario: Attempting to change the password too many times should lock the user out from the portal
    Given I visit the portal and supply a correctly formatted known userid
    When I try to change my password too many times
    Then I should be locked out of the portal
    And I should see message "exceeded the number of attempts"

  Scenario: Trying to change the password for a valid user who is locked on the central server.
    Given I visit the portal and supply a userid who is locked on the central server
    Then I answer the security questions correctly for valid user
    And I try to change the password
    Then I should see message "Password reset failed"

  Scenario: Trying to change a password for a user with no active roles.
    Given I visit the portal and supply a userid who has no active roles on the central server
    Then I answer the security questions correctly for valid user
    And I try to change the password
    Then I should see message "Password reset failed"

  Scenario: Trying to change a password for a user with not enough authorization details.
    Given I visit the portal and supply a userid who does not have enough verification details on the central server
    Then I answer the security questions correctly for valid user
    And I try to change the password
    Then I should see message "Password reset failed"

  Scenario: When a password is changed successfully the cookie data on the database should expire.
    Given I visit the portal and supply a correctly formatted known userid
    Then I answer the security questions correctly for valid user
    And I try to change the password
    Then the session cookie data should have been expired on the table session.

  Scenario: The security log should immediately save the questions once they are presented to the user.
    Given I visit the portal and supply a correctly formatted known userid
    Then questions presented should be stored correctly in table securitylog
    And the security log status for the current user should be set to failed in table securitylog

  Scenario: When some one tries to use a non existent cookie they should be taken back to the identify page.
     Given I visit the portal and supply a correctly formatted known userid
     Then I answer the security questions correctly for valid user
     And I change to cookie contents to an unknown cookie
     Then I try to change the password
     Then I should see a page with text "You must enter your User ID"

    @duplicate
  Scenario: User should be presented with questions having non repeating answer characters
    Given I visit the portal and supply a random userid whose format is valid
    Then I should see a page with text "Provide details to change password"
    And all the security questions should have non repeating characters being asked

  Scenario Outline: Malacious code in the cookie should not be allowed.
    When I visit the portal and supply a correctly formatted known userid
    Then I answer the security questions correctly for valid user
    And I change to cookie contents to have malacious text <cookie_contents>
    When I try to change the password
    Then I should not see text "Provide details to change password"

  Examples:
    | cookie_contents                  |
    | 64e7f2053c46759dcda4ed94f9dxx'-- |
    | 64e7f2053c46759dcda4ed94f9dxx#?> |
    | <?= phpinfo(); ?>da4ed94f9dxxXXX |
    | <script>document.write()</script>|