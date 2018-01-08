actions
addFilesToIndex: aCollection

	self assert: aCollection isDictionary not.
	self withRepoDo: [ :repo | 
		| index |
		index := repo index.
		index addAll: (aCollection collect: [ :each | 
				self assert: each asFileReference isRelative.
				self assert: (self location resolve: each) exists.
				each asFileReference path pathString ]).
		index writeToDisk ]