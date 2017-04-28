*** Settings ***
Library                         OperatingSystem
Library                         Selenium2Library
Resource                        ./pages-and-keywords/test_setup_and_teardown.robot
Resource                        ./pages-and-keywords/page_login.robot
Resource                        ./pages-and-keywords/page_dashboard.robot

Test setup                      Setup
Test Teardown                   Teardown

*** Test cases ***
Test Case 1
    Test login into the system
    Perform logout