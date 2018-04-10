examples
exampleUnbornRepository

	| repository |
	repository := IceMemoryRepository new.
	self assert: repository branch isUnbornBranch.
	^ repository