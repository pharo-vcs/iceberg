tests
testMergeWithConflicts
	| newVersionNumber testObject lastCommits toMerge | 
	"1. Prepare, create diverging but not conflicting changes in HEAD and upstream."
	newVersionNumber := self createIncomingCommit.
	self createConflictingModification.
	self checkLoadedLatestCommitWithVersion: newVersionNumber.

	"2. Exercise: Update the package from remote repository"
	toMerge := repository branch upstream commit.
	[ repository workingCopy mergeCommit: toMerge ]
		on: MCMergeResolutionRequest
		do: [ 	:resolutionRequest | 
			resolutionRequest merger conflicts do: [ :ea | ea chooseRemote ].
			resolutionRequest resume: true ].
	
	"3. Verify"
	testObject := (Smalltalk at: #Test) new.
	self assert: testObject versionNumber equals: newVersionNumber.

	lastCommits := self lastCommits: 4.
	self assert: (lastCommits at: 1) parentIds equals: (OrderedCollection with: (lastCommits at: 2) id with: (lastCommits at: 3) id).
	self assert: (lastCommits at: 2) parentIds equals: (OrderedCollection with: (lastCommits at: 4) id).
	self assert: (lastCommits at: 3) parentIds equals: (OrderedCollection with: (lastCommits at: 4) id).
	
	self assert: ((lastCommits at: 1) message includesSubstring: 'Merge').
	self assert: ((lastCommits at: 2) message endsWith: newVersionNumber asString).
	self assert: ((lastCommits at: 3) message endsWith: newVersionNumber asString).
	self assert: ((lastCommits at: 4) message endsWith: (newVersionNumber - 1) asString).

	self assert: repository incomingCommits isEmpty