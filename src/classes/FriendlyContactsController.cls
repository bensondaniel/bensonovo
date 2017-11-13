public with sharing class FriendlyContactsController {
	
	public List<Contact> contacts {get;set;}

	public FriendlyContactsController() {
		contacts = [SELECT Id, OVOCustomerID__c, FirstName, LastName, Gender__c, ContactLoyaltyStatus__c FROM Contact];
	} 

    public pagereference saveme(){
   		return NULL;
    
    }      

}