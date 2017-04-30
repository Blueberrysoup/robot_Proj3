*** Settings ***
Resource                                    page_list_reservation.robot
Library                                     String

*** Variables ***
${reservationnew_label_title}                    Create New Hotel Reservation
${reservationnew_button_save}                    xpath=//a[@class='btn btn-primary']
${reservationnew_button_show_all_reservations}   xpath=//a[text()='Show All Reservations']
${reservationnew_message_success}                Reservation was successfully created.
${reservationnew_textfield_entrydate}            id=entryDate
${reservationnew_textfield_exitdate}             id=exitDate
${reservationnew_select_bedroom}                 id=bedroomId
${reservationnew_select_client}                  id=clientId
${reservationnew_select_status}                  id=reservationStatusId  

# TODO: ändra så att inte datumen är hårdkodade
# Alternativt skriv inte in datum alls utan använd de förvalda
${reservationnew_datepicker_entrydate}            2018-01-01
${reservationnew_datepicker_exitdate}             2019-01-01
${reservationnew_datepicker_entrydate_formatted}  2018/01/01
${reservationnew_datepicker_exitdate_formatted}   2019/01/01

${reservationnew_option_status_confirmed}         1


*** Keywords ***

Create new confirmed reservation
    #Enter data
    Clear Element Text                       ${reservationnew_textfield_entrydate}
    Input Text                               ${reservationnew_textfield_entrydate}        ${reservationnew_datepicker_entrydate}
    Clear Element Text                       ${reservationnew_textfield_exitdate}
    Input Text                               ${reservationnew_textfield_exitdate}         ${reservationnew_datepicker_exitdate}
    Select From List By Value                ${reservationnew_select_bedroom}             ${bedroom_id_suite}
    Select From List By Value                ${reservationnew_select_client}              ${client_id_suite}
    Select From List By Value                ${reservationnew_select_status}              ${reservationnew_option_status_confirmed}
    #Save and go back to reservation list  --- FAIL!
    Click Element                            ${reservationnew_button_save} 
    Wait Until Page Contains                 ${reservationnew_message_success}     
    Click Element                            ${reservationnew_button_show_all_reservations}   
    Wait Until Page Contains                 ${reservationlist_label_clients}
    Page should contain                      ${room_name_suite}
    Page should contain                      ${room_floor_suite}
    Page should contain                      ${room_number_suite}
    Page should contain                      ${reservationnew_datepicker_entrydate_formatted}
    Page should contain                      ${reservationnew_datepicker_exitdate_formatted}
