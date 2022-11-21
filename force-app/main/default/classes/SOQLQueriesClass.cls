// Apex Hours SOQL Assignment // 

public class SOQLQueriesClass {
    
    public static List<Contact> fetchContactList;
    
    public static void insertMethod(){
        
        Account acc = new Account();
        acc.Name = 'Account 1';
        acc.AnnualRevenue = 500000;
        Database.upsert(acc, false); // Inserting the Parent Account Record
        
        Contact contact1 = new Contact();
        contact1.LastName = 'Contact Last 1';
        contact1.FirstName = 'Contact 1';
        contact1.AccountId = acc.Id;
        
        Contact contact2 = new Contact();
        contact2.LastName = 'Contact Last 2';
        contact2.FirstName = 'Contact 2';
        contact2.AccountId = acc.Id;
        
        Contact contact3 = new Contact();
        contact3.LastName = 'Contact Last 3';
        contact3.FirstName = 'Contact 3';
        contact3.AccountId = acc.Id;
        
        Contact contact4 = new Contact();
        contact4.LastName = 'Contact Last 4';
        contact4.FirstName = 'Contact 4';
        contact4.AccountId = acc.Id;
        
        Contact contact5 = new Contact();
        contact5.LastName = 'Contact Last 5';
        contact5.FirstName = 'Contact 5';
        contact5.AccountId = acc.Id;
        
        List<Contact> conlist = new List<Contact> {contact1, contact2, contact3, contact4, contact5};
            
            // Inserting related 5 contacts to the same Account
            upsert conlist;
        
        // Fetching related Contacts of the Parent Account //
        fetchContactList = [Select Id, Name from Contact Where AccountId =:acc.Id ORDER BY CreatedDate DESC];
        System.debug('Fetched Contacts with inserted Account Id:- '+fetchContactList);
        
        // Child to Parent Relationship Query //
        List<Contact> conNewList = [Select Id, Name, Account.Name, Account.AnnualRevenue from Contact where AccountId =:acc.Id];
        for(Contact con: conNewList){
            System.debug('Parent Account values for the Contacts:- '+con.Account.Name+', '+con.Account.AnnualRevenue);
        }
        
        // Parent to Child Relationship Query //
        List<Account> accountList = [Select Id, Name, (Select Id, Name from Contacts) from Account where Id =:acc.Id];
        for(Account accn: accountList){
            
            for(Contact cont : accn.Contacts){
                System.debug('Related Contacts for this Account:- '+cont);
            }
        }   
    }
}