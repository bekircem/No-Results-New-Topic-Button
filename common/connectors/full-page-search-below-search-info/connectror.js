export default {
    setupComponent(args, component) {
      component.set("noResults", false);
      
      component.addObserver("args.searchTerm", () => {
        const searchTerm = component.get("args.searchTerm");
        const resultCount = component.get("args.resultCount");
        
        if (searchTerm && resultCount === 0) {
          component.set("noResults", true);
        } else {
          component.set("noResults", false);
        }
      });
    }
  };