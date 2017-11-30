package steps;

import cucumber.api.java8.En;
import net.thucydides.core.steps.ExecutedStepDescription;
import net.thucydides.core.steps.StepEventBus;
import org.apache.commons.lang3.StringUtils;

public class TestSteps implements En {

    public TestSteps() {
        Given("some scenario", () -> { /* implement me! */});
        When("some step contains some doc string", () -> { /* implement me! */});
        /* implement me */
        Then("the content of that doc string should be included in the Serenity test report", this::showStepMessage);
    }

    public void showStepMessage(String message) {
        // TODO: escape message string for use in HTML
        String escapedMessage = StringUtils.replace(message, " ", "&nbsp;");

        StepEventBus.getEventBus().stepStarted(ExecutedStepDescription.withTitle(escapedMessage));
        StepEventBus.getEventBus().stepFinished();
    }
}
