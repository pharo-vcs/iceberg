actions
revertChange: anIceChange
	| loader |
	loader := MCPackageLoader new.
	anIceChange operation ifNotNil: [ :operation | operation inverse applyTo: loader ].
	loader load