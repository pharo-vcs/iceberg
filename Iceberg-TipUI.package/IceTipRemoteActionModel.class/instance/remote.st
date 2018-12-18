accessing
remote
	^ remote ifNil: [ | head |
		head := self repositoryModel entity head.
		remote := (head isBranch and: [ head hasUpstream ])
				ifTrue: [ head upstream remote ]
				ifFalse: [ self remoteModels first entity ] ]