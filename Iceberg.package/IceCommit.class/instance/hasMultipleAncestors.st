testing
hasMultipleAncestors
	| ancestors |
	ancestors := self ancestors.
	^ ancestors notNil 
		and: [ ancestors size > 1 ]