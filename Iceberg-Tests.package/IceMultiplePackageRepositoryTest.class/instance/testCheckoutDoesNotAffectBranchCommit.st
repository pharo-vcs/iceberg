tests-branch
testCheckoutDoesNotAffectBranchCommit

	| commitAtBranchTime createdBranch message |
	
	"Create new commit for this test"
	message := 'Added IceGeneratedClassForTesting'.
	"This is a Ring working copy"
	repository workingCopy
		createClass: 'IceAnotherGeneratedClassForTesting' 
		inPackage: packageName1 asSymbol.
	repository commitWithMessage: message.
	
	"Then create the new branch at this point"
	commitAtBranchTime := repository head commit.
	createdBranch := repository createBranch: 'new'.
	
	"And test"
	commitAtBranchTime ancestors first checkout.
	self assert: createdBranch commit equals: commitAtBranchTime