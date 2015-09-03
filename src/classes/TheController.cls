public with sharing class TheController {
    public Backlog__c back;
    
    public TheController (ApexPages.StandardController controller){
        back = (Backlog__c ) controller.getRecord();
    }
    
    public List<Tickets__c> getBacklog ()
    {
        return [SELECT Id,Name,Backlog__c FROM Tickets__c where  Backlog__c = :back.Id ];          
    }
}