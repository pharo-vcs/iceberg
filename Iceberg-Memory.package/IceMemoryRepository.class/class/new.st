instance creation
new

	| newRepository |
	newRepository := super new.
	newRepository
		initializeWithBranchRepository: MCDictionaryRepository new
		initializeWithCodeRepository: MCDictionaryRepository new.
	^ newRepository