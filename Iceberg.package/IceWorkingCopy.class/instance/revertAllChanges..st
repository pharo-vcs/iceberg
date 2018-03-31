actions
revertAllChanges: anIceChange
	| loader |
	loader := MCPackageLoader new.
	self revertAllChanges: anIceChange loader: loader.
	loader load