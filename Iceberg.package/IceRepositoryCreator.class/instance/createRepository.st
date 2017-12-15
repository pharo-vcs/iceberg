actions
createRepository	
	| repository |
	self validate.

	repository := self remoteToUse
		cloneIn: self locationToUse
		subdirectory: self subdirectory.
		
	self branchName ifNotNil: [
		repository switchToBranchNamed: self branchName ].
	
	^ repository