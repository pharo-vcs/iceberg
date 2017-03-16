accessing
subdirectories

	^ subdirectory 
		ifNil: [  {self class defaultSubdirectory} ]
		ifNotNil: [ ((subdirectory findTokens: ',') collect: #trimBoth) ]
	
	