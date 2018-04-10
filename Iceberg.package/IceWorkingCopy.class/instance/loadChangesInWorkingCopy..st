private-changes
loadChangesInWorkingCopy: aTree
	
	self ignoreNotificationsDuring: [
		aTree accept: (IceWorkingCopyPatcherVisitor on: self repository)
	]