API-accessing
branch
	"Returns head if head is a branch.
	Throws an exception if HEAD is not a branch"
	
	self head validateIsBranch.
	^ self head