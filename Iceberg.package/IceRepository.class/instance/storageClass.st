accessing
storageClass
	^ storageClass ifNil: [ storageClass := IceMCGitRepository ]