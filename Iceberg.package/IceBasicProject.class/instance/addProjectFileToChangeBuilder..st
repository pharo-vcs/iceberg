writing
addProjectFileToChangeBuilder: anIceChangeImporter 
	
	| projectFileName |
	self isUnborn ifTrue: [ ^ self ].
	
	self assert: self projectFilePath size = 1.
	projectFileName := self projectFilePath segments first.
	
	anIceChangeImporter
		addFileNamed: projectFileName
		path: self projectFilePath
		contents: self contentsString.