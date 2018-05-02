API-registry
delete
	"Delete is idempotent. If the repository does not exist, do nothing.
	Otherwise, forget the repository and remove it from the disk.
	Cleanup also the FFI handles."
	
	super delete.
	
	handle := nil.
	self locationIfPresent: [ :aLocation | aLocation ensureDeleteAll ]