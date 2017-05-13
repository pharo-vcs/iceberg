requirements
basicCodeDirectories
	^  self subdirectories isEmpty
		ifTrue: [ {self repositoryDirectory} ]
		ifFalse: [ self subdirectories collect: [ :each |
				each isEmpty 
					ifTrue: [ self repositoryDirectory ]
					ifFalse: [ self repositoryDirectory / each  ] ]].