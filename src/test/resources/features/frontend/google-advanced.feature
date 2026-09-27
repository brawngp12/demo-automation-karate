@regression @ui
Feature: Google Advanced UI Demo
  Demonstrates reusable driver config, screenshots, and element assertions

  Background:
    # Use headless: true for CI pipelines, false to watch the browser
    * configure driver = iphone16Driver
  @ui
  Scenario: Verify Google homepage elements
    Given driver 'https://digital.lottefinance.vn/vi'

    # Take a screenshot at the start
    * screenshot()

    # Assert the page title
    When title == 'Google'

    # Assert the Google logo is visible
    Then exists('#hplogo, img[alt="Google"]')

    # Assert the search input is present and interactable
    And exists('input[name="q"]')

    # Assert the "Google Search" button exists
    And exists('input[value="Google Search"]')

    # Assert the "I'm Feeling Lucky" button exists
    And exists('input[value="I\'m Feeling Lucky"]')


#  @ui
#  Scenario: Search and verify first result link is clickable
#    Given driver 'https://www.google.com'
#    And input('input[name="q"]', 'Karate API testing')
#    And key(Key.ENTER)
#    And waitFor('#search')
#
#    # Grab the first result heading text
#    * def firstResult = waitFor('h3')
#    * def firstResultText = firstResult.getText()
#    * print 'First result:', firstResultText
#
#    # Assert first result is not empty
#    Then match firstResultText != ''
#
#    # Take a screenshot of results
#    * screenshot()
#  @ui
#  Scenario Outline: Search for multiple terms and verify results page loads
#    Given driver 'https://www.google.com'
#    And input('input[name="q"]', '<searchTerm>')
#    And key(Key.ENTER)
#    And waitFor('#search')
#    Then match title contains '<searchTerm>'
#
#    Examples:
#      | searchTerm         |
#      | Karate framework   |
#      | Java automation    |
#      | API testing tools  |
