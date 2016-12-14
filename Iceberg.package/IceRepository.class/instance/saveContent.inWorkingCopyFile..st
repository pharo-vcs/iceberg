actions
saveContent: aString inWorkingCopyFile: aRelativePathString
	| outputFile |
	outputFile := self backend 
		saveContent: aString
		inWorkingCopyFile: aRelativePathString.
		
	self addFilesToIndex: { aRelativePathString }.

	^ outputFile