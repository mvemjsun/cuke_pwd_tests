@comms
Feature: Changing MOTCOMP passwords

 As a MOTCOMP smartcard holder
 I want to change my password using the password portal
 So that I dont need to call up the service desk

 Background:
 	Given I visit the change password website

Scenario: Trying to use the portal when communication with the central server is not available
	When A user tries to use the portal and communication with the central server is not available
	Then he should see an error message "There has been an error communicating with the central server."