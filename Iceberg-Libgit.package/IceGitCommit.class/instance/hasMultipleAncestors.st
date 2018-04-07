testing
hasMultipleAncestors
	| ancestors |
	"using ancestorsIds because ancestors will instantiate parents and is slower"
	ancestors := self ancestorIds.
	^ ancestors notNil 
		and: [ ancestors size > 1 ]