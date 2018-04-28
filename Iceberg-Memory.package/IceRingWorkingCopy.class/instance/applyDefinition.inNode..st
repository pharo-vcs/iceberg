private-impacting-changes
applyDefinition: anIceDefinition inNode: aNode

	| visitor |
	visitor := IceRingWorkingCopyChangerVisitor on: self.
	aNode accept: visitor.