accessing
descriptionText
	| text |
	
	text := self displayString asText.
	self entity isModified 
		ifTrue: [ text := ('*', text) asText makeAllColor: Color green ].
	^ text