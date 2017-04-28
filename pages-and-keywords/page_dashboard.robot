*** Settings ***
Resource                        page_login.robot


*** Variables ***
${dashboard_pg_label_dashboard}           Dashboard

${logout_menu}                            xpath=//a[@class='dropdown-toggle']
${logout_submenu}                         xpath=//i[@class='fa fa-sign-out fa-fw']


*** Keywords ***
Perform logout
    Wait Until Page Contains Element         ${logout_menu}
    Click Element                            ${logout_menu}
    Wait Until Page Contains Element         ${logout_submenu}
    Click Element                            ${logout_submenu}
    Wait Until Page Contains                 ${login_pg_label_login}
    Title should be                          ${login_pg_titel_login}   
    