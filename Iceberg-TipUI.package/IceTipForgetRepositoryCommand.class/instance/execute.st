execution
execute
	| okToForget repository | 
	
	repository := self repositoryModel entity.
	okToForget := UIManager default 
		confirm: (self class confirmMessage format: { #name -> repository name } asDictionary)
		label: self class defaultMenuItemName.
	okToForget ifFalse: [ ^ self ].
	repository forget. 
	"Forget announces himself the action, no need to send an extra announcement"