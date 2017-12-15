actions
createRepository	
	| repository |
	self validate.

	self remoteToUse ifNil: [
		^ IceLibgitRepository new
			location: self locationToUse;
			subdirectory: self subdirectory;
			yourself
	].

	repository := self remoteToUse
		cloneIn: self locationToUse
		subdirectory: self subdirectory.
		
	self branchName ifNotNil: [
		repository switchToBranchNamed: self branchName ].
	
	^ repository