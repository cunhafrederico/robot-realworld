*** Settings ***
Resource    home.resource.robot
Resource    ../commons/register-user.resource.robot

*** Variables ***

*** Test Cases ***
CT01 - Verify if homepage is loaded correctly with not logged in user
    Given that I access the realworld 'Home' page
    When page is loaded
    Then the title must have 'Conduit' as definition
    And the menu item 'Home' must be visible and point to the right link
    And the menu item 'Home' must be active
    And the menu item 'New Post' must not be visible
    And contain the feed type "Global Feed"
    And contain a max of '10' articles preview in this page
    And contain a min of '1' articles preview in this page
    And every article must not have a like buton
    And contain pagination element
    And pagination contain only one active item
    And a popular tags box must be visible at the sidebar
    And the tags box must be populated with at least '1' tag
    And get an evidence

CT02 - Verify if homepage is loaded correctly with logged in user
    [Tags]    smoke
    Given that I access the realworld 'Sign up' page
    When I register an user
    And the menu item 'Home' must be visible and point to the right link
    And the menu item 'Home' must be active
    And the menu item 'New Post' must be visible
    And contain the feed type "Global Feed"
    And contain a max of '10' articles preview in this page
    And contain a min of '1' articles preview in this page
    And every article must have a like buton
    And contain pagination element
    And pagination contain only one active item
    And a popular tags box must be visible at the sidebar
    And the tags box must be populated with at least '1' tag
    And get an evidence