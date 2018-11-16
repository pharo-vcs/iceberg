testing
isAlreadyMerged
	"The commit is already merged in the image and in the head commit.
	This means the selected commit is already in the history and there is nothing to do about it."

	^ mergeCommit isAncestorOf: self leftCommit