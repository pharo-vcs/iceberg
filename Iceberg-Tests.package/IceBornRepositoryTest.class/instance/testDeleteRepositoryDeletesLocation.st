tests-remotes
testDeleteRepositoryDeletesLocation

	"Test valid only for git backend. Other backends may not have location"
	fixture isGit ifFalse: [ ^ self skip ].
	
	self assert: self repository location exists.

	self repository delete.
	self deny: self repository location exists.