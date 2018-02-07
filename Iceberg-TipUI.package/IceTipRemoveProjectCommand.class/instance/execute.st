execution
execute
	| okToForget | 
	
	okToForget := UIManager default 
		confirm: (self class confirmMessage format: { #name -> nil })
		label: self class defaultMenuItemName.
	okToForget ifFalse: [ ^ self ].
	
	self repository forget