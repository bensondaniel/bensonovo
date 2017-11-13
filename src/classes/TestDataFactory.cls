@isTest
public class TestDataFactory{

    public static List<Contact> createContactsDefault(Integer numContacts) {

        List<Contact> contacts = new List<Contact>();
        for(Integer i=0;i<numContacts;i++) {
            Contact c = new Contact();
            c.FirstName = 'Test';
            c.LastName = 'Contact '+i;
            contacts.add(c);
        }

        insert contacts;
        return contacts;
    }

}