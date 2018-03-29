merging
mergeWithLeftNoOperation: anIceNoModification 
	
	"We assume that if the IceNoModification is in the tree this means its children have modifications.
	So a removal of a tree with modifications should be a conflict.
	
	This should maybe be enhanced: if my children are removals maybe this should not be a conflict, but this is the simplest solution right now."
	^ IceConflictingOperation left: anIceNoModification right: self