accessing
iconFor: item
	^ iconBlock 
		ifNotNil: [ iconBlock value: item ]
		ifNil: [ nil ]