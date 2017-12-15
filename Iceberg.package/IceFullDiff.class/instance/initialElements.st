initialization
initialElements
	^ self repository savedPackages
		collect: [ :package | self createChangeSetFor: package ]