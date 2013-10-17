@db
Feature: Changing MOTCOMP passwords

 As a MOTCOMP smartcard holder
 I want to change my password using the password portal
 So that I dont need to call up the service desk

 Background:
 	Given I visit the change password website

Scenario: Trying to use the portal when the database is not available
	Then he should see an error message "The service is currently unavailable.Please try again later"