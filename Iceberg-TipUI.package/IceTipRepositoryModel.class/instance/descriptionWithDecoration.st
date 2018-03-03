accessing
descriptionWithDecoration
	| text |
	
	text := self displayString asText.
	self entity isModified 
		ifTrue: [ text := ('*', text) asText makeAllColor: self colorModified ].
	^ text