tests
testNewRepositoryWorkingCopyIsNotLoaded

	| status |
	status := IceNotLoaded on: repository.
	self assert: status isNotLoaded.