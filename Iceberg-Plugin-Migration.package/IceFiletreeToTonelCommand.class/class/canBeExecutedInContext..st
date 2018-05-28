testing
canBeExecutedInContext: aToolContext
	self flag: #todo. "Demeters law"
	^ aToolContext repositoryModel entity writerClass id = #filetree