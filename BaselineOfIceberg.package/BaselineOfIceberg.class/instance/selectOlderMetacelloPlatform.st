script
selectOlderMetacelloPlatform
	(Smalltalk classNamed: #MetacelloPharo30Platform) ifNotNil: [ :c | 
		Transcript crShow: 'Select ', (c name).
		^ c select ].
	(Smalltalk classNamed: #MetacelloPharoPlatform) ifNotNil: [ :c | 
		Transcript crShow: 'Select ', (c name).
		^ c select ].
	
	self error: 'No metacello platform available'