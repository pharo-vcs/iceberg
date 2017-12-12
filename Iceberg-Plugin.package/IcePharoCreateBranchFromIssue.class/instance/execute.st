execute
execute
	IcePharoFogbugzModel new 
		onAccept: [ :branchName | 
			self createBranchNamed: branchName.
			acceptBlock ifNotNil: [ acceptBlock value ] ];
		openWithSpec.