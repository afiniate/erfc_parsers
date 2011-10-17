Feature: Support automatically converting fields into the proper type
  In order to make working with csv data easier
  As an Erlang Developer
  I want the 4180 parser to automatically convert fields into the appropriate erlang type

  Scenario: Types get correctly set
    Given valid csv file
    When erfc_4180 parses that file
    Then the parsed record fields have the correct types

