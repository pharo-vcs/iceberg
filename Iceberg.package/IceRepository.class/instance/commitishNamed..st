API-accessing
commitishNamed: aName
	"Resolve a name in the form of:
	  - a commit hash
	  - a branch name
	  - some other expression such as HEAD or master~1
	and return the corresponding iceberg object for it."

	^ self subclassResponsibility