API-changes
changesFromCommit: anIceNoCommit 
	"I am an unborn branch. This means the repository is not yet created and the commit is a no-commit"
	
	self assert: anIceNoCommit isNoCommit.
	^ #()