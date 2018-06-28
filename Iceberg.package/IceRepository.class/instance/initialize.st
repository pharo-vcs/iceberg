initialization
initialize
	super initialize.

	workingCopy := IceWorkingCopy basicNew.
	workingCopy repository: self.
	workingCopy initialize.
	
	index := self newIndex.