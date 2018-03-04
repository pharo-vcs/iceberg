accessing
headerColumn: column
	column id ifNil: [ ^ nil ].
	^ column newHeader 
		target: self;
		actionSelector: #actionColumn:;
		arguments: {column};	
		yourself