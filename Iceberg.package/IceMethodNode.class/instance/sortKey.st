equality
sortKey
	
	^ self parent name, '.', (self parent isMeta ifTrue: ['meta'] ifFalse: ['nonmeta']), '.', name