writing
addProjectFileToChangeBuilder: anIceChangeImporter 
	
	| projectFileName |
	self isUnbornProject ifTrue: [ ^ self ].
	
	self assert: self projectFilePath size = 1.
	projectFileName := self projectFilePath segments first.
	
	anIceChangeImporter
		addFileNamed: projectFileName
		path: self projectFilePath
		contents: self contentsString.