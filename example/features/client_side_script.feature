Feature: Client-Side Script
  
  Scenario: Visiting a page with client-side script
    When I open my app
    Then my client-side script is executed

  Scenario: Passing ENV vars
    When I open my app
    Then I see the environment variables
