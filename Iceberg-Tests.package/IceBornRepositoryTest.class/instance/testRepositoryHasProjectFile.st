tests-branch
testRepositoryHasProjectFile

	fixture isUnbornProjectFixture ifTrue: [ ^ self skip ].
	fixture factory isGit ifFalse: [ ^ self skip ].
	self repository head isUnbornBranch ifTrue: [ ^ self skip ].
	
	self assert: (self repository location / '.project') exists