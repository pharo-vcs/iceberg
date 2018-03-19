private
addDecorationTo: aString
	| text |
	text := aString asText.
	self entity isHead 	
		ifTrue: [ text := text allBold ].
	^ text