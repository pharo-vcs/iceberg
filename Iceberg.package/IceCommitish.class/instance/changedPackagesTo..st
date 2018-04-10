private-changes
changedPackagesTo: aCommitish
	"This method will implement a double dispatch, since the strategies to resolve deltas 
	 change if you are comparing: 
		- loaded code -> working copy
		- a commit -> a branch 
		- a commit -> a commit
	 and they need to be treated differently"
	^ self subclassResponsibility