loaded code
updatedWith: aPackageVersion 
	self versions at: aPackageVersion package put: aPackageVersion. 
	
	^ aPackageVersion commit = self commit
		ifTrue: [ ^ self ]
		ifFalse: [ self halt. ^ IceHeterogeneusVersionsLoaded versions: self versions ]