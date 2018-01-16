API-changes
revertChange: aPatch 
	| loader |
	loader := MCPackageLoader new.
	aPatch applyRevertedInto: loader.
	loader load.
