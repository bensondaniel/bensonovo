({
   loadContacts : function(cmp) {
        // Load all contact data
        var action = cmp.get("c.getContacts");
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                cmp.set("v.contacts", response.getReturnValue());
                cmp.set("v.contactList", response.getReturnValue());
                this.updateTotal(cmp);
            }

            // Display success message to indicate load status
            var successEvent = $A.get("e.force:showSuccess");
            if (state === 'SUCCESS'){
                successEvent.setParams({
                    "title": "Success!",
                    "message": " Your contacts have been loaded successfully."
                });
            }
            else {
                successEvent.setParams({
                        "title": "Error!",
                        "message": " Something has gone wrong."
                });
            }
            successEvent.fire();
        });
         $A.enqueueAction(action);
    },
     
    updateTotal: function(cmp) {
      var contacts = cmp.get("v.contacts");
      cmp.set("v.totalContacts", contacts.length);
    }
})