*** Settings ***
Library    RequestsLibrary
Library    JSONLibrary
Library    Collections


*** Variables ***
${url}    https://fakestoreapi.com/products
${url_login}    https://fakestoreapi.com/auth/login


*** Test Cases ***
API_001 API Verify Get All Product
    # Set URL, Header, Body
    # Send Request
    # Valiadate, Verify
    ${response}    GET    ${url}
    ${response_json}    Set Variable    ${response.json()}
    ${log_json}    Evaluate    json.dumps(${response_json}, indent=4)    json
    Log    ${log_json}

    ${product_count}    Get Length    ${response_json}
    Should Be Equal As Numbers    ${product_count}    20

    Dictionary Should Contain Key    ${response_json}[0]    id
    Dictionary Should Contain Key    ${response_json}[0]    title
    Dictionary Should Contain Key    ${response_json}[0]    price
    Dictionary Should Contain Key    ${response_json}[0]    description
    Dictionary Should Contain Key    ${response_json}[0]    category
    Dictionary Should Contain Key    ${response_json}[0]    image
    Dictionary Should Contain Key    ${response_json}[0]    rating

API002 API Login Success
    ${headers}    Load Json From File    ${CURDIR}/../Resources/Schema/header.json
    ${body}       Load Json From File    ${CURDIR}/../Resources/Schema/body.json
    ${response}    POST    ${url_login}    headers=${headers}    json=${body}
    Log    ${response.json()}

    Dictionary Should Contain Key    ${response.json()}    token

    ${token}    Set Variable    ${response.json()}[token]
    Log    ${token}