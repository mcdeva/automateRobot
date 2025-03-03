*** Settings ***
Library    Browser
Resource    ../Repositories/login_repository.resource


*** Variables ***
@{product_list}    Sauce Labs Backpack
...                Sauce Labs Bike Light
...                Sauce Labs Bolt T-Shirt
...                Sauce Labs Fleece Jacket
...                Sauce Labs Onesie
...                Test.allTheThings() T-Shirt (Red)


*** Keywords ***
Open Url Saucedemo
    New Browser    chromium    False            # Browser, Headless
    New Context                                 # ignoreHTTPSErrors = True
    New Page    https://www.saucedemo.com/

Input Username
    Type Text    ${txt_username}    standard_user

Input Password
    Type Text    ${txt_password}    secret_sauce

Input Invalid Password
    Type Text    ${txt_password}    1234

Click Login Button
    Click    ${btn_login}

Verify Login Success
    ${actual_title}    Get Text    //*[@class="app_logo"]
    Should Be Equal As Strings    ${actual_title}    Swag Labs

Verify Login Fail Invalid Password
    ${actual_title}    Get Text    //*[@data-test="error"]
    Should Be Equal As Strings    ${actual_title}    Epic sadface: Username and password do not match any user in this service

Wait Title Page Visible
    Wait For Elements State    //*[@class="app_logo"]

Verify All Products Details
    [Tags]    keyword_communicate
    FOR    ${item}    IN RANGE    1    7    # เริ่ม 1 จนถึง 6
        Verify Product Name            ${item}
        Verify Product Detail          ${item}
        Verify Price                   ${item}
        Verify Add To Cart Button      ${item}
        Verify Image Visible           ${item}
    END

Verify Product Name
    [Tags]    keyword_action
    [Arguments]    ${item}
    ${product_name}    Get Text    (//*[@data-test="inventory-item-name"])[${item}]
    ${index}    Evaluate    ${item} - 1
    Should Be Equal As Strings    ${product_name}    ${product_list}[${index}]

Verify Product Detail
    [Tags]    keyword_action
    [Arguments]    ${item}
    ${product_detail}    Get Text    (//*[@data-test="inventory-item-desc"])[${item}]
    Should Not Be Empty    ${product_detail}

Verify Price
    [Tags]    keyword_action
    [Arguments]    ${item}
    ${product_price}    Get Text    (//*[@data-test="inventory-item-price"])[${item}]
    Should Not Be Empty    ${product_price}

Verify Add To Cart Button
    [Tags]    keyword_action
    [Arguments]    ${item}
    ${add_to_cart}    Get Text    (//*[@class="pricebar"]//button)[${item}]
    Should Be Equal As Strings    ${add_to_cart}    Add to cart

Verify Image Visible
    [Tags]    keyword_action
    [Arguments]    ${item}
    Wait For Elements State    (//*[@class="inventory_item_img"])[${item}]