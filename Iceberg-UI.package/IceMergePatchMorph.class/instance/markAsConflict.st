actions
markAsConflict
	"Mark the operation as unresolved conflict."
	
	self selectedChangeWrapper item value clearSelection.
	self changed: #changes.
	self updateSource.