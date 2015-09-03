trigger TriggerProjects on Projects__c (after insert) {
    List <Backlog__c> backlogInsert = new List <Backlog__c>();
    for (Projects__c project:Trigger.new){ 
        Backlog__c backlog = new Backlog__c();
        backlog.Name = 'Product Backlog '+ project.Name;
        backlog.Project__c = project.id;
        backlog.RecordTypeId = '01261000000J8tcAAC';
        backlogInsert.add(backlog);      
    }
	insert backlogInsert;   
}