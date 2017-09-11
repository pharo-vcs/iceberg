actions
commitIndexWithMessage: message andParents: parentCommitishList
	| packages newCommit |

	newCommit := self backend
		commitIndexWithMessage: message 
		andParents: parentCommitishList.
	newCommit repository: self.
	
	packages := parentCommitishList 
		inject: Set new 
		into: [ :all :each | all addAll: (each diffTo: newCommit) changedPackages; yourself ].
	
	self loadedCode 
		commited: newCommit changingPackages: packages.
	
	^ newCommit