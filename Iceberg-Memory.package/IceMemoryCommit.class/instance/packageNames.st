accessing
packageNames
	
	^ (mcCommit dependencies collect: [ :each | each package name ]) asArray