public class ContactSearch {

    public static List<Contact> searchForContacts(String lastName, String zip) {
        List<Contact> contacts = new List<Contact>();
        
        contacts = [SELECT Id, Name FROM Contact WHERE LastName = :lastName and MailingPostalCode = :zip];
        
        return contacts;
    }
}