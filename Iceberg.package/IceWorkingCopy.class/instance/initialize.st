initialization
initialize

	super initialize.
	shouldIgnoreNotifications := false.
	
	packages := Dictionary new.
	referenceCommit := IceNoCommit repository: repository.
	project := referenceCommit project.
	properties := referenceCommit properties asBornProperties