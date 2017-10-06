script
selectOlderMetacelloPlatform
	(Smalltalk classNamed: #MetacelloPharo30Platform) ifNotNil: [ :c | ^ c select ].
	(Smalltalk classNamed: #MetacelloPharoPlatform) ifNotNil: [ :c | ^ c select ].
	
	self error: 'No metacello platform available'