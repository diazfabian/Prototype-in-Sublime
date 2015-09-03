public class MoveTicketFromProductToSprint {
    
    public MoveTicketFromProductToSprint(ApexPages.StandardController controller) {
     
    }
    
    List<String> originalvalues = new List<String>();
    Public List<String> leftselected{get;set;}
    Public List<String> rightselected{get;set;}
    Set<String> leftvalues = new Set<String>();
    Set<String> rightvalues = new Set<String>();
    List<String> opts = new List<String>();
     
    public MoveTicketFromProductToSprint(){
        leftselected = new List<String>();
        rightselected = new List<String>();
        AddTickets();
        leftvalues.addAll(opts);
    }
    
    
    public void AddTickets() {
    	Id SprintId = ApexPages.CurrentPage().getParameters().get('id');
    	List<Backlog__c> Backlog = [SELECT Project__c FROM Backlog__c WHERE Id = :SprintId];
    	ID projectID;
    	for (Backlog__c b : Backlog ){
    		projectID =b.Project__c;
    	}
        List<Tickets__c> Tickets = [SELECT Name 
						         	FROM Tickets__c 
						         	WHERE Backlog__r.RecordType.Name = 'Product Backlog' 
						         	AND Backlog__r.Project__c = :projectID];
        for (Tickets__c a : Tickets) {
            opts.add(a.Name);        
        }
        originalvalues = opts;   
    }
     
    public PageReference selectclick(){
        rightselected.clear();
        for(String s : leftselected){
            leftvalues.remove(s);
            rightvalues.add(s);
        }
        return null;
    }
     
    public PageReference unselectclick(){
        leftselected.clear();
        for(String s : rightselected){
            rightvalues.remove(s);
            leftvalues.add(s);
        }
        return null;
    }
 
    public List<SelectOption> getunSelectedValues(){
        List<SelectOption> options = new List<SelectOption>();
        List<string> tempList = new List<String>();
        tempList.addAll(leftvalues);
        tempList.sort();
        for(string s : tempList){
            options.add(new SelectOption(s,s));
        }
        return options;
    }
 
    public List<SelectOption> getSelectedValues(){
        List<SelectOption> options1 = new List<SelectOption>();
        List<String> tempList = new List<String>();
        tempList.addAll(rightvalues);
        tempList.sort();
        for(String s : tempList){
            options1.add(new SelectOption(s,s));
        }
        return options1;
    }
    
    public void ButtonActionSave(){
        List<SelectOption> ValueSelected = getSelectedValues();
        String NameTicket = '';
        for(SelectOption value : ValueSelected){
            NameTicket = value.getValue();
            List<Tickets__c> OldTicket = ticketsOld(NameTicket);
            List<Tickets__c> NewTicket = ticketsNew(OldTicket);
            Boolean permission = getfieldstart();
            if(permission){
            	DeleteUpdateTicket(OldTicket, NewTicket);
            	ApexPages.addmessage(new ApexPages.message(ApexPages.severity.CONFIRM,'Added successfully...'));
            }else{
            	ApexPages.addmessage(new ApexPages.message(ApexPages.severity.WARNING,'You cant add more tickets because the sprint already started'));
            }
        }  
    }
    
    public List<Tickets__c> ticketsOld(String nameTicket){
        List<Tickets__c> listOld = [SELECT Backlog__c,CreatedById,Description__c,Id,Name,Sort_order__c,Status__c,Story_Point__c,Type_Of_Ticket__c 
                                    FROM Tickets__c 
                                    WHERE Name = :nameTicket];
        return listOld;
    }
    
    public List<Tickets__c> ticketsNew(List<Tickets__c> ListTicket){
        List<Tickets__c> listNew = new List<Tickets__c>();
        Id SprintId = ApexPages.CurrentPage().getParameters().get('id');
        for(Tickets__c tick : ListTicket){
            Tickets__c ticket = new Tickets__c();
            ticket.Backlog__c = SprintId;
            ticket.Name = tick.Name;
            ticket.Sort_order__c = tick.Sort_order__c;
            ticket.Status__c = tick.Status__c;
            ticket.Story_Point__c = tick.Story_Point__c;
            ticket.Type_Of_Ticket__c = tick.Type_Of_Ticket__c;
            ticket.Description__c = tick.Description__c;
            listNew.add(ticket);
        }
        return listNew;
    }
    
    public boolean getfieldstart(){
    	Id SprintId = ApexPages.CurrentPage().getParameters().get('id');
    	Boolean permission = null;
    	List<Backlog__c> startvalue = [SELECT Start__c FROM Backlog__c WHERE Id = :SprintId];
    	if(!startvalue.equals(null)){
    		permission = true;
    	}else{
    		permission = false;
    	}
    	return permission;
    }
    
    public void DeleteUpdateTicket(List<Tickets__c> ListOld, List<Tickets__c> ListNew){
        delete ListOld;
        insert ListNew;
    }
}