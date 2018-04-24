tests
testMergeWithFileRemovedWithMerge
	| fileRef otherFileRef branchMaster branchRemove |
	
	fileRef := self repository location / 'test-to-remove.txt'.
	fileRef writeStreamDo: [ :stream | stream << 'to-remove' ].
	self repository index addPath: (fileRef relativeTo: self repository location).
	self repository commitWithMessage: 'first commit'.
	branchMaster := self repository branch.

	self repository checkoutBranch: 'remove-branch'.
	fileRef ensureDelete.
	self repository index addPath: (fileRef relativeTo: self repository location).
	self repository commitWithMessage: 'commit removed file'.
	branchRemove := self repository branch.	
	
	branchMaster checkout.
	otherFileRef := self repository location / 'other-test-to-remove.txt'.
	otherFileRef writeStreamDo: [ :stream | stream << 'to-remove' ].
	self repository index addPath: (fileRef relativeTo: self repository location).
	self repository commitWithMessage: 'commit 2nd file'.	
	
	branchRemove merge.
	
	self assert: otherFileRef exists.
	self deny: fileRef exists.