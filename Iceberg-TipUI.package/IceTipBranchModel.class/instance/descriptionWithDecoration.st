accessing
descriptionWithDecoration
	| text |
	text := self name asText.
	self entity isHead 	
		ifTrue: [ text := text allBold ].
	^ text