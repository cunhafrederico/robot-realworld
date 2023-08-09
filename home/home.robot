*** Settings ***
Resource    home.resource.robot

*** Variables ***

*** Test Cases ***
CT01 - Verify if homepage is loaded correctly with not logged user
    Given that I access the realworld homepage
    When page is loaded
    Then the title must have 'Conduit' as definition
    And the menu item 'Home' must be visible and point to the right link
    And the menu item 'New Post' must not be visible and point to the right link