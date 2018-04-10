merging
mergeWithLeftNoOperation: anIceNoModification 
	
	"This should not happen. If I represent an addition of a node, that means that the original definition did not exist on the base version.
	Thus, the left version can never have an operation on the same element."
	self shouldNotImplement