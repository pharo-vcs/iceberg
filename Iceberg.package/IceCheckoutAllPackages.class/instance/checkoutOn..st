checkout
checkoutOn: anIceWorkingCopy
	
	anIceWorkingCopy
		loadPackagesNamed: committish packageNames
		fromCommit: committish commit.
	self repository setHead: committish.
	anIceWorkingCopy referenceCommit: committish commit.
	anIceWorkingCopy markAllPackagesAsClean.