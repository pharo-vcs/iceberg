initialization
initialize
	super initialize.
	workingCopy := IceWorkingCopy repository: self.
	index := self newIndex.