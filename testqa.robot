*** Settings ***
Library    SeleniumLibrary
Task Setup    Open web browser
Suite Setup    Set Selenium Speed    0.5s
Suite Teardown    Close Browser


*** Variables ***
${BROWSER}                                      chrome
${URL}                                          https://the-internet.herokuapp.com
### multiplewindows
${locator_btn-menu-multiplewindows}             xpath=//*[@id="content"]/ul/li[33]/a
${locator_btn-newwindows}                       xpath=//*[@id="content"]/div/a
${locator_txt-newwindows}                       xpath=/html/body/div
### fileupload
${locator_btn-menu-fileupload}                  xpath=//*[@id="content"]/ul/li[18]/a
${locator_btn-fileupload}                       id=file-upload
${locator_btn-submitfileupload}                 id=file-submit
${locator_checkfileupload}                      id=uploaded-files
### Sortable Data Tables
${locator_btn-menu-datatables}                  xpath=//*[@id="content"]/ul/li[41]/a
${locator_btn-edit-action}                      xpath=//*[@id="table1"]/tbody/tr[1]/td[6]/a[1]
${locator_btn-delete-action}                    xpath=//*[@id="table1"]/tbody/tr[1]/td[6]/a[2]

*** Keywords ***
Open web browser
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Page Contains    Welcome to the-internet    10s
    

*** Test Cases ***
TC-001 Upload a file
    [Documentation]    ใช้ทำสอบหน้าอัพโหลดรูปภาพ
    [Tags]    run
    Click Element                               ${locator_btn-menu-fileupload}
    Wait Until Element Is Visible               ${locator_btn-fileupload}            10s
    Choose File                                 ${locator_btn-fileupload}            /Users/jansatorn/Desktop/EdVISORY TEST/cat1.jpg
    Click Element                               ${locator_btn-submitfileupload}
    Wait Until Element Is Visible               ${locator_checkfileupload}            10s
    Close Browser

TC-002 Multiple Windows
    [Documentation]    ใช้สำหรับทดสอบหน้า newwindows
    [Tags]    run
    Click Element                               ${locator_btn-menu-multiplewindows}
    Wait Until Element Is Visible               ${locator_btn-newwindows}    10s
    Click Element                               ${locator_btn-newwindows}
    ${headles}=    Get Window Handles
    Switch Window    ${headles}[1]
    Wait Until Page Contains                    New Window    10s

TC-003 Sortable Data Tables
    [Documentation]    ไม่เข้าใจว่าต้องทำอะไรกับตารางครับยัง งงๆโจท ถ้าเป็นโจทอื่นนอกจากนี้ทำได้หมดครับ
    [Tags]    off
    


