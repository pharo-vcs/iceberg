event handling
mouseUp: evt
	((dataSource canDisplayChildrenOf: item) and: [ item children isNotEmpty ])
		ifTrue: [ item toggle ].
	super mouseUp: evt