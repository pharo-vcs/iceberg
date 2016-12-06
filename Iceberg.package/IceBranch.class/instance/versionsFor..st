querying
versionsFor: package
	"Returns only the commits modifying the package."
	^ self repository newCommitWalk 
		from: self; 
		versionsFor: package
