import Component from "@glimmer/component";
import { service } from "@ember/service";
import { tracked } from "@glimmer/tracking";
import DButton from "discourse/components/d-button";

export default class SearchResultsNoResult extends Component {
  @service currentUser;
  @service composer;
  @tracked searchController;

  constructor() {
    super(...arguments);
    const controller = this.args._target?.lookup("controller:full-page-search");
    if (controller) {
      this.searchController = controller;
    }
  }

  createNewTopic = () => {
    this.composer.open({
      action: "createTopic",
      draftKey: "new_topic",
      draftSequence: 0
    });
  };

  <template>
    {{#if this.searchController.searchTerm}}
      {{#unless this.searchController.model.resultCount}}
        <div class="custom-no-results">
          <h3>No results found.</h3>
          <p class="no-results-text">Can't find what you're looking for?</p>
          {{#if this.currentUser}}
            <div class="search-no-results-actions">
              <DButton
                @class="btn-primary create-topic-button"
                @action={{this.createNewTopic}}
                @icon="plus"
                @label="topic.create"
              />
            </div>
          {{/if}}
        </div>
      {{/unless}}
    {{/if}}
  </template>
}