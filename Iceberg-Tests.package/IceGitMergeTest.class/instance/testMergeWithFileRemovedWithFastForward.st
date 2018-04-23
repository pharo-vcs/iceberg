tests
testMergeWithFileRemovedWithFastForward
	| fileRef branchMaster branchRemove |
	
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
	branchRemove merge.
	
	self deny: fileRef exists