accessing
chosenOperation
	
	^ chosen
		ifNil: [ operation ]
		ifNotNil: [ chosen ]