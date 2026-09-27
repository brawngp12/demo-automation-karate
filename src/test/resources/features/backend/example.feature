@smoke @regression
Feature: Example API Tests
  Demonstrates basic Karate API test patterns using JSONPlaceholder.

  Background:
    # baseUrl is set in karate-config.js
    * url baseUrl
    * configure headers = myGlobalHeaders
    * def inputData = read('classpath:testdata/input/example/data.json')
    * def expectedData = read('classpath:testdata/output/example/data.json')
  @smoke
  Scenario: Get a single get 1
    Given path 'le-table/stock/MBB'
    And params inputData
    * karate.log('input:', karate.pretty(inputData))
    When method GET
    Then status 200
    And match response == expectedData
    * karate.log('output:', karate.pretty(expectedData))

  @smoke
  Scenario: Get a single get 2
    Given path 'le-table/stock/MBB'
    And params {pageSize: 2}
    When method GET
    Then status 200
    # And match response.id == 1
    # And match response.title == '#notnull'
    # And match response.body == '#notnull'

