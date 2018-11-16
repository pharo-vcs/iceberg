tests
testMergeOfInnessaryMergeCommit
	| c1 c2 c3 c4 i1  fileRef|

	"When producing a merge, sometimes Github produces a merge commit that is not necessary. 
	This merge commit includes two commits that are also included in the chain of ancestors of the head.

	Initial state:

	(c4) <-- master
	 | 
	 |	
	 | 
	 v	 
	(c3) <--(i1) <-- incoming
	 |       |
	 v       |
	(c2)     |
	 |       |
	 v       |
	(c1) <----

	Expected State:
	
	(merge)--   <-- master
	 |       |
    |       |
	 v       |
	(c4)     | 
	 |       |
	 |       |	
	 |       | 
	 v       v	 
	(c3) <--(i1) <-- incoming
	 |       |
	 v       |
	(c2)     |
	 |       |
	 v       |
	(c1) <----
		
	"

	c1 := self repository commitWithMessage: 'C1'.
	
	fileRef := self repository location / 'c2.txt'.
	fileRef writeStreamDo: [ :stream | stream << 'c2' ].
	self repository index addPath: (fileRef relativeTo: self repository location).
	c2 := self repository commitWithMessage: 'C2'.

	fileRef := self repository location / 'c3.txt'.
	fileRef writeStreamDo: [ :stream | stream << 'c3' ].
	self repository index addPath: (fileRef relativeTo: self repository location).
	c3 := self repository commitWithMessage: 'C3'.

	fileRef := self repository location / 'c4.txt'.
	fileRef writeStreamDo: [ :stream | stream << 'c4' ].
	self repository index addPath: (fileRef relativeTo: self repository location).
	c4 := self repository commitWithMessage: 'C4'.

	c3 checkout.
	self repository checkoutBranch: 'incoming'.

	i1 := self repository
		commitIndexWithMessage: 'Merge'
		andParents: {c3. c1}.
	
	self repository checkoutBranch: 'master'.
	
	i1 merge. 
	
	self assert: self repository branch commit ancestors equals: { c4. i1 }.
	self assert: self repository branch commit comment equals: 'Merge ' , i1 id.
