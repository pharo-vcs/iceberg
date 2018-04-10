actions
doCommit
	self 
		doCommit: diffPanel selectedItems 
		message: commentPanel message
		pushing: commentPanel isPushing