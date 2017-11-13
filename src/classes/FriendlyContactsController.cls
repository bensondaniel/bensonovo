public with sharing class FriendlyContactsController {
	
	public List<Contact> contacts {get;set;}

	public FriendlyContactsController() {
		OVORestController ovo = new OVORestController();
        ovo.fetchOVOPayload();
		contacts = [SELECT Id, Salutation, OVOCustomerID__c, FirstName, LastName, Gender__c, ContactLoyaltyStatus__c FROM Contact];
	} 

    public pagereference saveme(){
   		try {
        	update contacts;
    	} catch(Exception e){
        	System.debug('Exception occurred '+String.valueOf(e));
    	}
    return NULL;
	}

}