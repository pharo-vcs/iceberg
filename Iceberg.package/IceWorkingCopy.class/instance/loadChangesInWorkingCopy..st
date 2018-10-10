private-changes
loadChangesInWorkingCopy: aTree
	
	| visitor |
	visitor := IceWorkingCopyPatcherVisitor on: self repository.
	aTree accept: visitor.
	
	self ignoreNotificationsDuring: [
		visitor load.
	]
