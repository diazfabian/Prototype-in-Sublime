public  class Mycontroller{
   
    private final Account item;
       public Mycontroller() {
        List<Tickets__c> item = [SELECT Id,Name FROM Tickets__c ];
    }

    public Account getitem() {
        return item;
    }

    public PageReference save() {
        update item;
        return null;
    }
}