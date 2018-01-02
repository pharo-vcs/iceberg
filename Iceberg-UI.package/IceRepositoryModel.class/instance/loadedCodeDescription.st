accessing
loadedCodeDescription
	self verifyDirectoryStructureIfMissing: [ :message | ^ message ].
	^ self repository workingCopy description