initialization
initialize

	super initialize.
	shouldIgnoreNotifications := false.
	
	packages := Dictionary new.
	referenceCommit := repository newNoCommit.
	self basicSetProject: referenceCommit project.
	properties := referenceCommit properties asBornProperties