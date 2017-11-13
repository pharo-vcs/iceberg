actions
pullFrom
	| remote |

	remote := self pickRemote: 'Pull from'.
	remote ifNil: [ ^ self ].
	[ self repository pullFrom: remote ]
	on: IceShouldCommitBeforePull 
	do: [ :e | e acceptError: (IceInteractiveErrorVisitor repository: self repository) ]