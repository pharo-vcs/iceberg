tests
testPullNonFF
	| newVersionNumber testObject lastCommits | 
	"1. Prepare, create diverging but not conflicting changes in HEAD and upstream."
	newVersionNumber := self createIncommingCommit.
	self createNonConflictingModification.
	self checkLoadedLatestCommitWithVersion: newVersionNumber.

	"2. Exercise: Update the package from remote repository"
	repository pull.
	
	"3. Verify"
	testObject := (Smalltalk at: #Test) new.
	self assert: testObject versionNumber equals: newVersionNumber.
	self assert: testObject nonConflictingMethod equals: newVersionNumber.

	lastCommits := self lastCommits: 4.
	self assert: (lastCommits at: 1) parentIds equals: (OrderedCollection with: (lastCommits at: 2) id with: (lastCommits at: 3) id).
	self assert: (lastCommits at: 2) parentIds equals: (OrderedCollection with: (lastCommits at: 4) id).
	self assert: (lastCommits at: 3) parentIds equals: (OrderedCollection with: (lastCommits at: 4) id).
	
	self assert: ((lastCommits at: 1) message includesSubstring: 'Merge').
	self assert: ((lastCommits at: 2) message endsWith: newVersionNumber asString).
	self assert: ((lastCommits at: 3) message endsWith: newVersionNumber asString).
	self assert: ((lastCommits at: 4) message endsWith: (newVersionNumber - 1) asString).
