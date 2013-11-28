@security
Feature: Access to directories and individual files should not be allowed from the url.

  As a password portal website user
  I should not have access to any of the directories
  so that I can view directory contents or execute individual files
  all requests should be routed to index.php in document root.

  Scenario Outline: : User trying to list contents of the app directory in document root
    When I try to visit the <folder_name> folder under document root
    Then I should see apache message "Access forbidden"

    Examples:
    | folder_name |
    | ***         |
    | ******      |
    | ********    |
    | ***         |
    | *******     |
    | *****       |
    | *****       |
