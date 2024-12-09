import Component from "@glimmer/component";
import { service } from "@ember/service";
import DButton from "discourse/components/d-button";

export default class SearchNoResultsButton extends Component {
  @service composer;
  
  createNewTopic = () => {
    this.composer.open({
      action: "createTopic",
      draftKey: "new_topic",
      draftSequence: 0
    });
  };

  <template>
    <div class="search-no-results-actions">
      <DButton
        @class="btn-primary create-topic-button"
        @action={{this.createNewTopic}}
        @icon="plus"
        @label="topic.create"
      />
    </div>
  </template>
}
