@Stackoverflow @HOWTO
Feature: Is there any possibility to include the content of "Doc Strings" in Serenity test reports?

  In Gherkin "Doc Strings" may follow any step. They start and end with three double quotes
  and allow you to specify a larger piece of text.

  Scenario: A user wants to include some custom message ("Doc Strings") on his Serenity test report
    Given some scenario
    When some step contains some doc string
    Then the content of that doc string should be included in the Serenity test report
    	"""
            {
              "name": "Include doc strings in serenity report",
              "id": "include-doc-strings-in-serenity-report;show-an-example;;2",
              "testSteps": [
                {
                  "number": 1,
                  "description": "Some example #1: {value=FOO, state=Completed}",
                  "duration": 4,
                  "startTime": 1496915325896,
                  "result": "SUCCESS",
                  "precondition": false
                }
              ]
            }
    	"""
