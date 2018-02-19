visiting
visitMethodNode: anIceMethodNode 
	
	| ownerNode |
	ownerNode := anIceMethodNode parent accept: self.
	ownerNode childAt: anIceMethodNode selector put: anIceMethodNode.
	^ anIceMethodNode