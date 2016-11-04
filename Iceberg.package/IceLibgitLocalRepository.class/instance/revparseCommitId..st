querying
revparseCommitId: aString 
	self withRepoDo: [ :repo | 
		^ (repo revparse: aString) object id hexString
	]