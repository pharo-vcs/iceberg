actions
saveContent: aString inWorkingCopyFile: aRelativePathString 
	| outputFile |
	outputFile := (self codeDirectory fullName , '/' , aRelativePathString) asFileReference.
	outputFile writeStreamDo: 
		[ :stream |
		stream nextPutAll: aString ].
	^ outputFile