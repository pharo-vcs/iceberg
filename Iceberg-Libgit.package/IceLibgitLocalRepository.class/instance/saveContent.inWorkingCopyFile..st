actions
saveContent: aString inWorkingCopyFile: aRelativePathString
	| outputFile |
	outputFile := (location fullName , '/' , aRelativePathString) asFileReference.
	outputFile writeStreamDo: 
		[ :stream |
		stream nextPutAll: aString ].
	^ outputFile