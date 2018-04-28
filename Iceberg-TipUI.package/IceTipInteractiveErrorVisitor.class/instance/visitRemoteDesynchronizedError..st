visiting
visitRemoteDesynchronizedError: anError
	| continue command |
	
	continue := UIManager default
		confirm: ('Your repository is out of sync with remote {1}. 
You need to pull remote changes before continue and push your changes.' format: { anError remote })
		label: 'Remote repository out of sync!'
		trueChoice: 'Pull'
		falseChoice: 'Cancel'
		cancelChoice: nil
		default: false.	
	(continue isNil or: [continue not])
		ifTrue: [ ^ self ].	

	command := IcePullRemoteCommand new
		repository: self repository;
		remote: anError remote;
		yourself.

	[ command execute ]
	on: IceMergeAborted, IceShouldCommitBeforePull
	do: [ :e |
		self flag: #todo. "Refactor this" 
		(e isKindOf: IceShouldCommitBeforePull)
			ifTrue: [ e resume ]
			ifFalse: [ e acceptError: self ] ].
	
	command isSuccess ifFalse: [ ^ self ].
	anError isResumable ifTrue: [ ^ anError resume ].
	anError retry