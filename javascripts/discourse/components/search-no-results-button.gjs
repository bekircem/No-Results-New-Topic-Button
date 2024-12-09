import Component from "@glimmer/component";
import DButton from "discourse/components/d-button";
import { service } from "@ember/service";
import { action } from "@ember/object";

export default class SearchResultsNoResult extends Component {
  @service composer;

  @action
  createNewTopic() {
    this.composer.open({
      action: "createTopic",
      draftKey: "new_topic",
      draftSequence: 0
    });
  }

  <template>
    <div class="custom-no-results">
      <DButton
        @class="btn-primary create-topic-button"
        @action={{this.createNewTopic}}
        @icon="plus"
        @label="topic.create"
      />
    </div>
  </template>
}