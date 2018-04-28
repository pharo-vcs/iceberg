private-impacting-changes
applyDefinition: anIceDefinition 

	| visitor |
	visitor := IceRingWorkingCopyChangerVisitor on: self.
	anIceDefinition accept: visitor.