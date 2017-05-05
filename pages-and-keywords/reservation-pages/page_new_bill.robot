*** Settings ***
Resource                                    page_list_reservation.robot
Library                                     String
Library                                     DateTime 

*** Variables ***
${bill_button_left}                         xpath=//*[@id='side-menu']/li[4]/a
${create_new_bill_button}                   xpath=//a[@class='btn btn-primary']
${save_new_bill_button}                     xpath=//a[@class='btn btn-primary']
${billnew_label_title}                      Create New Bill

${billnew_select_status}                    id=j_idt50:billStatusId
${billnew_select_type}                      id=j_idt50:hotelReservationId

#As it is not possible to create a new reservation we will use an existing reservation in 
#this test. Make sure the bill for reservation nr 3 does not exist before running test. 

${billnew_option_status_pay}                1
${billnew_option_reservation_code3}         3

${bill_message_success}                     Bill was successfully created.
${billnew_button_show_all_bills}            xpath=//a[text()='Show All Bills']
${billnew_str}                              xpath=//*[@id='j_idt50']/table/tbody/tr[1]/td[2]/span



*** Keywords ***
Create new bill
    Click Element                            ${bill_button_left}
    Wait Until Page Contains                 ${reservationlist_label_clients} 
    Click Element                            ${create_new_bill_button}
    Wait Until Page Contains                 ${billnew_label_title} 
    Select From List By Value                ${billnew_select_status}              ${billnew_option_status_pay}
    Select From List By Value                ${billnew_select_type}                ${billnew_option_reservation_code3}
    Click Element                            ${save_new_bill_button} 
    Wait Until Page Contains                 ${bill_message_success} 
    ${billnew_id}=                           Get text      ${billnew_str} 
    Click Element                            ${billnew_button_show_all_bills} 
    Page should contain                      ${billnew_id}   
    