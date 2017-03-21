accessing
loadedCodeDescription
	self repository isMissing 
		ifTrue: [ ^ self makeError: 'Local repository missing' ].
	self repository isCodeMissing
		ifTrue: [ ^ self makeError: 'Code directory missing' ].
	^ self repository loadedCode description