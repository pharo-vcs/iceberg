commits
addCommit: newCommit
	commits add: 
		(self repository commitDictionary at: newCommit id
			ifPresent: [ :commit | 
				self assert: commit username = newCommit username.
				self assert: commit datetime = newCommit datetime.
				self assert: commit parentIds = newCommit parentIds.
				self assert: commit comment = newCommit comment.
				commit.
			]
			ifAbsentPut: (
				newCommit 
					repository: self repository; 
					yourself))