execution
execute
	| okToForget | 
	
	okToForget := UIManager default 
		confirm: (self class confirmMessage format: { #name -> self repositoryModel name } asDictionary)
		label: self class defaultMenuItemName.
	okToForget ifFalse: [ ^ self ].
	self repositoryModel delete