accessing
resolve: aRelativePath ifAbsent: aBlock
	
	^ self resolve: aRelativePath ifPresent: [ :each | each ] ifAbsent: aBlock