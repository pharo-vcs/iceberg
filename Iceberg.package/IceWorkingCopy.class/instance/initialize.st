initialization
initialize

	super initialize.
	shouldIgnoreNotifications := false.
	
	packages := Dictionary new.
	referenceCommit := repository newNoCommit.
	project := referenceCommit project.
	properties := referenceCommit properties asBornProperties