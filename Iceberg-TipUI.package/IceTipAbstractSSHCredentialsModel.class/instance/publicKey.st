accessing
publicKey
	^ publicKeyInput location ifNil: [ '' ] ifNotNil: [ :x | x pathString ]