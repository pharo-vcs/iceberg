actions
doCommit: items message: aString pushing: aBoolean
	self model 
		commit: items 
		message: aString
		pushing: aBoolean.
 	self model reset.
	self refresh	