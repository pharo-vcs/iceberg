tests
testUseExistingLocalRepo
	"prepare"
	IceGitCommand in: self absoluteLocation parent execute: {'clone'. origin}.
	IceGitCommand in: self absoluteLocation execute: {'checkout -b newBranch'}.

	"exercise"
	repository := IceRepository origin: origin location: self absoluteLocation.
	
	"test"
	self assert: (repository allPackages includes: (Ice packageNamed: 'Pharo-Git-Test' )).
	self assert: repository branch equals: 'newBranch'.

