accessing
descriptionWithDecoration
	| text |
	
	text := self displayString asText.
	self entity isLoaded
		ifFalse:[ text := text makeAllColor: self colorNotLoaded ].
	self entity isModified 
		ifTrue: [ text := ('*', text) asText makeAllColor: self colorModified ].
	^ text