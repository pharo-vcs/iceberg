suspending
suspendAllMatching: matchBlock while: aBlock
	suspendedConditions add: matchBlock.
	aBlock ensure: [ suspendedConditions remove: matchBlock ]