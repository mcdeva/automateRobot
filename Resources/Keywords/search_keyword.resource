*** Settings ***
Library    Browser
Resource    ../Testdata/common.resource
Resource    ../Repositories/search_repository.resource
Resource    ../Localized/${lang}/search_localized.resource
Resource    ../Testsite/${site}/search.resource


*** Keywords ***
Open Url Duckduckgo
    [Documentation]    keyword_action    # keyword_command, keyword_action, keyword_communicate
    # Open Browser    https://duckduckgo.com/
    New Browser    chromium    False            # Browser, Headless
    New Context                                 # ignoreHTTPSErrors = True
    New Page    https://duckduckgo.com/

Input Text Search
    [Documentation]    keyword_action
    Type Text    //*[@id="searchbox_input"]    robot

Enter On Text Search
    [Documentation]    keyword_action
    Press Keys    //*[@id="searchbox_input"]    Enter

Verify First Link
    [Documentation]    keyword_action
    ${actual_text}    Get Text    ${lbl_first_link}
    Should Be Equal As Strings    ${actual_text}    ${verify_text}
    # Should Contain    ${actual_text}    Robot

Open Main Page
    New Browser    chromium    False            # Browser, Headless
    New Context                                 # ignoreHTTPSErrors = True
    New Page    ${url_main_page}

Wait First Link Visible
    Wait For Elements State    ${lbl_first_link}

Scroll To More Results Button
    Scroll To Element    ${btn_more_results}

Click More Results Button
    Click    ${btn_more_results}

Verify Number Page Results
    ${actual_result_page}    Get Text    ${lbl_page_2}
    Should Be Equal As Strings    ${actual_result_page}    2
