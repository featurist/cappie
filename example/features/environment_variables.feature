Feature: Environment Variables
  
  Scenario: Passing ENV vars
    When I open my app
    Then environment variables are set in the app process
