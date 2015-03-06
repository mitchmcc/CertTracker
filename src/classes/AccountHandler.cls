public class AccountHandler {

    public static Account insertNewAccount(String acctName) {
        
        if ((acctName == null) || (acctName.equals(''))) {
            return null;
        }
        
        try {
            Account acc = new Account(Name=acctName);
            return acc;
        } catch (DmlException e) {
            return null;
        }
        
    }
}