tests
testMergeWithMissingProjectFile
	| incomingBranch fileRef |

	self repository checkoutBranch: 'master'.	
	self repository commitWithMessage: 'Initial Commit'.

	self repository checkoutBranch: 'localBranch'.
	self repository workingCopy project: self repository newUnbornProject.
	fileRef := self repository location / 'test1.txt'.
	fileRef writeStreamDo: [ :stream | stream << 'test1' ].
	self repository index addPath: (fileRef relativeTo: self repository location).
	self repository commitWithMessage: 'commiting something'.
	incomingBranch := self repository branch.
	
	self repository checkoutBranch: 'master'.	
	self repository workingCopy project: (IceBasicProject onRepository: self repository withSourceDirectory: '').
	fileRef := self repository location / 'test2.txt'.
	fileRef writeStreamDo: [ :stream | stream << 'test2' ].
	self repository index addPath: (fileRef relativeTo: self repository location).
	self repository commitWithMessage: 'second commit in master'.

	incomingBranch merge.
		
	self assert: self repository workingCopy referenceCommit comment equals: 'Merge ' , incomingBranch commit id