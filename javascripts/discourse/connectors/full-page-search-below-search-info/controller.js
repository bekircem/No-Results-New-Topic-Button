import { action } from "@ember/object";
import { inject as service } from "@ember/service";

export default {
  router: service(),
  composer: service(),
  
  @action
  createNewTopic() {
    this.composer.open({
      action: "createTopic",
      draftKey: "new_topic",
      draftSequence: 0
    });
  }
}