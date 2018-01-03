initialization
initialize
	super initialize.
	system := false.
	
	"by default, this is not a system repository"
	commitDictionary := Dictionary new.
	
	workingCopy := IceWorkingCopy repository: self.