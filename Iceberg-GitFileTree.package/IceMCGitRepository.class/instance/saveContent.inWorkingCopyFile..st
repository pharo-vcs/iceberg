actions
saveContent: aString inWorkingCopyFile: aRelativePathString 
	| outputFile |
	outputFile := (directory fullName , '/' , aRelativePathString) asFileReference.
	outputFile writeStreamDo: 
		[ :stream |
		stream nextPutAll: aString ].
	^ outputFile