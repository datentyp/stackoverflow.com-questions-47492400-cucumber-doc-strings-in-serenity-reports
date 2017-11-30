# README

This repository contains some example code to illustrate how the content of "Doc Strings" can be included on Serenity test reports. 

It is a response to a question asked by a user with the name _s2oBCN_ on Stack Overflow. The complete thread is available at: <https://stackoverflow.com/questions/47492400/cucumber-doc-strings-in-serenity-reports>

s2oBCN asked:

> We are thinking to make some tests in Cucumber in the way of getting Living Documentation, and the key for the "Living documentation" is that in the "Then" we want to use "Doc Strings" (Json strings).

> But, we realized that the "Doc Strings" are not shown in the Serenity Reports.

> Is there any possibility to show the "Doc Strings" inside the Serenity Reports?

## Example Code

  * `src/resources/features/test.feature` contains a feature file with some doc string
  * `src/test/java/steps/TestSteps.java` contains the glue code, the step definitions, where we make use of the StepEventBus API from Serenity to 
add content on the report

```java

public class TestSteps implements En {

    // ...

    public void showStepMessage(String message) {
        // TODO: escape message string for use in HTML
        String escapedMessage = StringUtils.replace(message, " ", "&nbsp;");

        StepEventBus.getEventBus().stepStarted(ExecutedStepDescription.withTitle(escapedMessage));
        StepEventBus.getEventBus().stepFinished();
    }
}

```

## Best Practice

Note that if you really want to append some JSON Doc Strings to your Then steps than I think you might be trying to do the wrong thing in the first place.

You can capture the actual HTTP request/response that was send over the wire by using serenity-rest-assured. This way your reports will not only
include the expected JSON payload but also the HTTP headers and payload of both, the request and the response.


If you are interested in this have a look at the documentation:  <http://thucydides.info/docs/serenity-staging/#_testing_rest_with_serenity_bdd>