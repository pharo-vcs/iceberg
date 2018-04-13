instance-creation
inRepository: anIceMemoryRepository named: aString 
	
	^ (super inRepository: anIceMemoryRepository)
		name: aString;
		yourself