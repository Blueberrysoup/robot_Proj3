*** Settings ***
Resource                            page_new_bill.robot

*** Variables ***
${bill_button_left}                        xpath=//*[@id='side-menu']/li[4]/a
${reservationlist_label_bills}             List
${create_new_bill_button}                  xpath=//a[@class='btn btn-primary']



*** Keywords ***
Go to create new bill   
    Page should contain element              ${create_new_bill_button}
    Click Element                            ${create_new_bill_button}
    Wait Until Page Contains                 ${billnew_label_title} 
    