accessing
selectMatching: aSymbol from: aCollection
	aSymbol = #modified
		ifTrue: [ ^ aCollection select: #isModified ].
	aSymbol = #notLoaded
		ifTrue: [ ^ aCollection reject: #isLoaded ].
	self error: 'This sorting is not accepted: ' , aSymbol