public with sharing class FriendlyContactsController {
	
	public List<Contact> contacts {get;set;}

	public FriendlyContactsController() {
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

	@RemoteAction
    public static Object fetchOVOResponse() {
    	OVORestController ovo = new OVORestController();
        Object ovoResponse = ovo.fetchOVOPayload();
        return ovoResponse; 
    }

}