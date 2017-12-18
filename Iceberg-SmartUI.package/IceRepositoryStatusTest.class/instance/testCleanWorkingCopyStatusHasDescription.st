tests
testCleanWorkingCopyStatusHasDescription

	| status |
	status := IceCleanWorkingCopy on: repository.
	self assert: status shortDescription equals: 'Working Copy is clean'.
	self assert: status longDescription equals: 'The working copy is clean and synchronized with the current branch. There are no changes to commit. Synchronize with remote repositories to check for incoming and outgoing commits from/to other repositories.'.