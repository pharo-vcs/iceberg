querying
versions
	"Containing info in the repo makes it easy to refresh."
	^ self repository currentBranch versionsFor: self
