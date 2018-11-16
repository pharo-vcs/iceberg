testing
isInverseMerge
	"When the image commit corresponds to the mergeCommit. 
	It means we are in an inverse merge. We want to merge the changes from the image into head commit.
	
	This is false when the image commit corresponds with head. In this other scenario, we want to merge the changes from the merge commit into head commit."
	^ self imageCommit = mergeCommit