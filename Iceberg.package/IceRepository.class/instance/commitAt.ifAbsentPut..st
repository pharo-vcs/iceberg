commits
commitAt: commitId ifAbsentPut: aBlock
	^ self commitDictionary at: commitId ifAbsentPut: [ aBlock value ]