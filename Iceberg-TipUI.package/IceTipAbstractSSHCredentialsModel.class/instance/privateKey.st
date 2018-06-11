accessing
privateKey
	^ privateKeyInput location ifNil: [ '' ] ifNotNil: [ :x | x pathString ]