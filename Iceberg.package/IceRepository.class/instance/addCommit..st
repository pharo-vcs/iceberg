private
addCommit: newCommit
	"I will only add a commit if it there is not another one with the same id already in my dictionary.
	In such case I will return the old commit, and the new one must be discarded."
	
	"Use attibute directly and not accessor because accessor will try to lazily load commits, 
	and this method is used during commit loading."
	^ (commitDictionary at: newCommit id
			ifPresent: [ :commit | 
				"Validate consistency between two commits"
				self assert: commit username = newCommit username.
				self assert: commit datetime = newCommit datetime.
				self assert: commit parentIds = newCommit parentIds.
				self assert: commit comment = newCommit comment.
				commit.
			]
			ifAbsentPut: [
				newCommit 
					repository: self; 
					yourself
			])
					