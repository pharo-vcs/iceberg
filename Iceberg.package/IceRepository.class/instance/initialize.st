initialization
initialize
	super initialize.
	system := false. "by default, this is not a system repository"
	commitDictionary := Dictionary new.
	self initializeAnnouncer.
	workingCopy := IceWorkingCopy repository: self.