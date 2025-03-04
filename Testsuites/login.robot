*** Settings ***
Resource    ../Resources/Keywords/login_keyword.resource


*** Test Cases ***
Login_001 Verify Login Success
    [Tags]    TestLogin
    Open Url Saucedemo
    Input Username
    Input Password
    Click Login Button
    Verify Login Success
    Take Screenshot

Login_003 Verify Login Fail Invalid Password
    Open Url Saucedemo
    Input Username
    Input Invalid Password
    Click Login Button
    Verify Login Fail Invalid Password
    Take Screenshot

Login_004 Verify Products Visible
    [Tags]    test
    Open Url Saucedemo
    Input Username
    Input Password
    Click Login Button
    Wait Title Page Visible
    Verify All Products Details
    Take Screenshot

Login_005 Verify Login Success
    Open Url Saucedemo
    Input Username
    Input Password
    Click Login Button
    Verify Login Success
    Take Screenshot