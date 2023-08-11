*** Settings ***
Resource    home.resource.robot

*** Variables ***

*** Test Cases ***
CT01 - Verify if homepage is loaded correctly with not logged in user
    Given that I access the realworld homepage
    When page is loaded
    Then the title must have 'Conduit' as definition
    And the menu item 'Home' must be visible and point to the right link
    And the menu item 'Home' must be active
    And the menu item 'New Post' must not be visible
    And contain the feed type "Global Feed"
    And contain a max of '10' articles preview in this page
    And contain a min of '1' articles preview in this page
    And every article must have a like buton
    And contain pagination element
    And pagination contain only one active item
    And a popular tags box must be visible at the sidebar
