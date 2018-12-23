private-changes
loadChangesInWorkingCopy: aTree
	
	| visitor |
	visitor := IceRingWorkingCopyChangerVisitor on: self.
	
	self ignoreNotificationsDuring: [
		aTree accept: visitor.
	]
