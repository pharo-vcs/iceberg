events
onCommit: aBlock
	commitButton action: [ 
		aBlock 
			cull: commentText text asString
			cull: pushCheckbox state ]