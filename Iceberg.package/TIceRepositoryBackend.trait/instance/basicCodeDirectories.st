requirements
basicCodeDirectories
	^  self subdirectories isEmpty
		ifTrue: [ {self repositoryDirectory} ]
		ifFalse: [ self subdirectories collect: [ :each |
				self repositoryDirectory / each ]].