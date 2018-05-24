accessing
codeDirectoryWithDelim
	 ^ self repository subdirectory isEmptyOrNil 
		ifTrue: [ '' ]
		ifFalse: [ self repository subdirectory, '/' ]