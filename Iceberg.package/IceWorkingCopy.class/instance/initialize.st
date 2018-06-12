initialization
initialize

	super initialize.
	shouldIgnoreNotifications := false.
	
	packages := Dictionary new.
	referenceCommit := IceNoCommit repository: repository.
	self project: referenceCommit project