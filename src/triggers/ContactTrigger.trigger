trigger ContactTrigger on Contact (after insert, after update, after delete) {
	
	if(trigger.isInsert){
		
		ContactTriggerHelper.afterInsert(trigger.new);
	}
	
	if(trigger.isDelete){
		
		ContactTriggerHelper.afterDelete(trigger.old);
	}
}