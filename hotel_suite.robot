*** Settings ***
Library                         OperatingSystem
Library                         Selenium2Library
Resource                        ./pages-and-keywords/test_setup_and_teardown.robot
Resource                        ./pages-and-keywords/page_login.robot
Resource                        ./pages-and-keywords/page_dashboard.robot
Resource                        ./pages-and-keywords/client-pages/page_list_client.robot

Test setup                      Setup
Test Teardown                   Teardown

*** Test cases ***
Test1_LoginLogoutAdmin    
    Login into the system
    Perform logout
  
Test2_CreateRoom
    Login into the system
    Show all bedrooms
    Go to create new bedroom form
    Create new bedroom Top Bed King Vacant        
    Perform logout
        
Test3_CreateNewClient
    Login into the system
    Show all clients
    Go to create new client form
    Create new female client
    Perform logout

Test5_DeleteClient
    Login into the system
    Show all clients
    Go to create new client form
    Create new female client
    Perform delete client    
    Perform logout

Test7_CreateNewReservation
    Login into the system
    Show all clients
    Go to create new client form
    Create new female client
    Back to dashboard from client list
    Show all bedrooms
    Go to create new bedroom form
    Create new bedroom Top Bed King Vacant
    Back to dashboard from bedroom list
    Show all reservations
    Go to create new reservation form
    Create new confirmed reservation
    Perform logout
    