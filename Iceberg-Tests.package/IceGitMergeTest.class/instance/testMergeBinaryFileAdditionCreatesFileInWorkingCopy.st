tests
testMergeBinaryFileAdditionCreatesFileInWorkingCopy
	| fileRef branchMaster newBranch |

	fileRef := self repository location / 'firstCommitFile'.
	self repository index addPath: (fileRef relativeTo: self repository location).
	self repository commitWithMessage: 'First commit'.	
	branchMaster := self repository branch.

	self repository checkoutBranch: 'add-file-branch'.
	newBranch := self repository branch.

	fileRef := self repository location / 'test-to-remove.bin'.

	fileRef binaryWriteStreamDo: [ :stream | stream nextPutAll: IceFileDefinitionTests bytesWithIlegalLeadingBytes ].
	self repository index addPath: (fileRef relativeTo: self repository location).
	self repository commitWithMessage: 'Add file'.
	

	branchMaster checkout.	
	self deny: fileRef exists.

	newBranch merge.
	self assert: fileRef exists.