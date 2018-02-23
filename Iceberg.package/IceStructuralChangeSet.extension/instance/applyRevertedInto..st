operations
applyRevertedInto: aLoader
	
	self operation ifNotNil: [ :anOperation | anOperation inverse applyTo: aLoader ].
	
	self elements do: [ :e | e applyRevertedInto: aLoader ]