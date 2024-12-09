import Component from "@glimmer/component";
import { service } from "@ember/service";
import { tracked } from "@glimmer/tracking";

export default class SearchConnector extends Component {
  @service currentUser;
  @tracked searchController;

  constructor() {
    super(...arguments);
    const controller = this.args._target?.lookup("controller:full-page-search");
    if (controller) {
      this.searchController = controller;
    }
  }
}