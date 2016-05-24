tests
testUseExistingLocalRepo
	"prepare"
	IceGitCommand in: absoluteLocation parent execute: {'clone'. origin}.

	"exercise"
	repository := IceRepository origin: origin location: absoluteLocation.
	
	"test"
	self assert: (repository allPackages includes: (Ice packageNamed: 'Pharo-Git-Test' ))

