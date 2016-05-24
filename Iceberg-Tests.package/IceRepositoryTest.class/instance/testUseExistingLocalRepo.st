tests
testUseExistingLocalRepo
	"prepare"
	IceGitCommand in: absoluteLocation parent execute: {'clone'. origin}.
	IceGitCommand in: absoluteLocation execute: {'checkout -b newBranch'}.

	"exercise"
	repository := IceRepository origin: origin location: absoluteLocation.
	
	"test"
	self assert: (repository allPackages includes: (Ice packageNamed: 'Pharo-Git-Test' )).
	self assert: repository branch equals: 'newBranch'.

