changes
applyOperationOn: aMCPatcher 
	
	operation ifNotNil: [ operation applyTo: aMCPatcher ].
	self changes do: [ :e | e applyOperationOn: aMCPatcher ]