checkout
checkoutOn: anIceWorkingCopy 
	
	anIceWorkingCopy loadChangesInWorkingCopy: self diff.
	self repository setHead: committish.
	anIceWorkingCopy referenceCommit: committish commit.
	anIceWorkingCopy markAllPackagesAsClean.