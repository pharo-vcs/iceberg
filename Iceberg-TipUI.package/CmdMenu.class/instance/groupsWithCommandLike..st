accessing
groupsWithCommandLike: aCommandClass 
	
	| result |
	result := rootGroup allGroupsWhich: [ :each | each includesCommand: aCommandClass ].
	(rootGroup includesCommand: aCommandClass)
		ifTrue: [ result add: rootGroup ].
	^result