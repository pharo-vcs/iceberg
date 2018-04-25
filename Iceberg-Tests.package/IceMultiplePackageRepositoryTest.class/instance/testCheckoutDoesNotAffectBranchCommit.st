tests-branch
testCheckoutDoesNotAffectBranchCommit

	| commitAtBranchTime createdBranch message |
	
	"Create new commit for this test"
	message := 'Added IceGeneratedClassForTesting'.
	"This is a Ring working copy"
	self  repository workingCopy
		createClass: 'IceAnotherGeneratedClassForTesting' 
		inPackage: self packageName1 asSymbol.
	self  repository commitWithMessage: message.
	
	"Then create the new branch at this point"
	commitAtBranchTime := self  repository head commit.
	createdBranch := self  repository createBranch: 'new'.
	
	"And test"
	commitAtBranchTime ancestors first checkout.
	self assert: createdBranch commit equals: commitAtBranchTime