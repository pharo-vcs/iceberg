*Iceberg-UI
browse
	
	| browsed |
	browsed := Smalltalk globals at: name.
	browsed isMeta ifTrue: [ browsed classSide ].
	browsed browse