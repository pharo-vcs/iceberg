accessing
headHistory
	
	^ headHistory ifNil: [ 
		headHistory := IceHistory on: repository headCommit repository: repository ]