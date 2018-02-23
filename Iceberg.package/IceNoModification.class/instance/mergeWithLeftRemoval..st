merging
mergeWithLeftRemoval: anIceRemoval
	
	"We assume that if I'm in the operation tree this means my children have modifications.
	So a removal of a tree with modifications should be a conflict.
	
	This should maybe be enhanced: if my children are removals maybe this should not be a conflict, but this is the simplest solution right now."
	^ IceConflictingOperation left: anIceRemoval right: self