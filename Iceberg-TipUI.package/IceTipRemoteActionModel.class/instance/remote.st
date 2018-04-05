accessing
remote
	^ remote ifNil: [ | branch |
		branch := self repositoryModel entity branch.
		remote := branch hasUpstream
				ifTrue: [ branch upstream remote ]
				ifFalse: [ self remoteModels first entity ] ]