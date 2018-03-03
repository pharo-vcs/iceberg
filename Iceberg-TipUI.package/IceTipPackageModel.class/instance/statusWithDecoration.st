accessing
statusWithDecoration
	| text |
	
	text := self status asText.
	self entity isLoaded 
		ifFalse: [ text := text makeAllColor: self colorNotLoaded ].
	^ text