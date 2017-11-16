visiting
visitRemoteDesynchronizedError: anError
	| solveStrategy command |
	solveStrategy := UIManager default 
		chooseFrom: #(
			'Pull from remote then push' )
		values: { 
			IcePullRemoteCommand }
		message: 'Your local repository is not synchronized with the remote repository. 
You need to solve this problem before you continue, please choose one of the strategies below.'
		title: 'Local and remote repositories out of sync!'.
	solveStrategy ifNil: [ ^ self ].
	[ (command := solveStrategy new) 
		repository: self repository;
		remote: anError remote;
		execute ]
	on: IceMergeAborted do: [ :e | e acceptError: self ].
	command isSuccess 
		ifTrue: [ anError retry ]