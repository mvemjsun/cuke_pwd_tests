@crud
Feature: CRUD operations on the database schema

Scenario: be able to successfully create a row in the passwordattempt log
	When I try to insert data into table passwordattemptlog it should be successfully inserted

Scenario: not be able to create duplicate row in the passwordattempt log
    When I create duplicate data into table passwordattemptlog it should be rejected

Scenario: be able to successfully create a row in the session
	When I try to insert data into table session it should be successfully inserted

Scenario: Invalid data in session table should not be allowed
    When I try to create an empty record for table session it should fail

Scenario: not be able to create duplicate row in the session
    When I create duplicate data into table session it should be rejected

Scenario: be able to successfully create a row in the sessiondata
	When I try to insert data into table sessiondata it should be successfully inserted

Scenario: Creating session without a session id should fail
    When I try to create a session_data without session id it should fail

Scenario: not be able to create duplicate row in the sessiondata
    When I create duplicate data into table sessiondata it should be rejected

Scenario: be able to successfully create a row in the securitylog
	When I try to insert data into table securitylog it should be successfully inserted

Scenario: not be able to create duplicate row in the securitylog
    When I create duplicate data into table securitylog it should be rejected
