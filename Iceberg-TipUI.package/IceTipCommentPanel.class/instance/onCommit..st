events
onCommit: aBlock
	commitButton action: [ 
		aBlock 
			cull: self message
			cull: self isPushing ]