*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${BROWSER}        chrome
${BASE_URL}       http://localhost:9080
${CONTEXT_PATH}   

*** Test Cases ***
Test Health Check Page
  Open Browser  about:blank  ${BROWSER}
  Go To  ${BASE_URL}${CONTEXT_PATH}/health
  Page Should Contain  Ratings is healthy
  Capture Page Screenshot
  [Teardown]  Close Browser
