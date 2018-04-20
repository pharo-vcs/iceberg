accessing
numberOfOutgoingCommits
	^ [ | size |
		self entity branch hasUpstream ifFalse: [ ^ '*' ].
		size := self outgoingCommits size.
		size > 100
			ifTrue: [ '99+' ]
			ifFalse: [ size ] ]
		on: IceNotInBranch do: [ :e | 0 ]