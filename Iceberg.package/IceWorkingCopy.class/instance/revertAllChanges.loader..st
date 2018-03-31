actions
revertAllChanges: anIceChange loader: aLoader
	anIceChange operation ifNotNil: [ :operation | operation inverse applyTo: aLoader ].
	anIceChange elements do: [ :each | self revertAllChanges: each loader: aLoader ]