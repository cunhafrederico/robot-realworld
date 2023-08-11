*** Settings ***
Resource    ../commons/register-user.resource.robot
Resource    login.resource.robot

*** Variables ***

*** Test Cases ***
CT01 - Login with valid username and password
    [Tags]    smoke
    Given that I access the realworld 'Sign in' page
    When I login in with valid email and password
    Then I will be redirected to 'Home' page
    And get an evidence

CT02 - Login with valid username and invalid password
    [Tags]    smoke
    Given that I access the realworld 'Sign in' page
    When I login in with valid email and invalid password
    Then login page will show a big message 'Something went wrong'
    And get an evidence

CT03 - Login with invalid username and valid password
    Given that I access the realworld 'Sign in' page
    When I login in with invalid email and valid password
    Then login page will show a big message 'Something went wrong'
    And get an evidence

CT04 - Login with invalid username and password
    Given that I access the realworld 'Sign in' page
    When I login in with invalid email and password
    Then login page will show a big message 'Something went wrong'
    And get an evidence