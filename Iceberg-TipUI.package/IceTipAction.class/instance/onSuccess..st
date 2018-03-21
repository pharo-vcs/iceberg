accessing
onSuccess: aBlock 
	"Some actions need to execute something right after finish. Like a refresh of panels, etc.
	 If a block is defined here, it will be evaluated right after the command is executed, if 
	 there are no exceptions."
	successBlock := aBlock