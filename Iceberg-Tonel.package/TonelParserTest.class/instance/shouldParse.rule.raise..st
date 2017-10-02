asserting
shouldParse: aString rule: rule raise: error 
	| parser |
	
	parser := TonelParser on: aString readStream.
	self 
		should: [ parser perform: rule ]
		raise: error