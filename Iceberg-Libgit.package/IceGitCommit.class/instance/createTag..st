API-tags
createTag: aString 

	self repository handleLibgitError: [ 
		self repositoryHandle
			createTag: aString
			targetId: self libgitCommit id
			force: false.
		^ IceTag
			named: aString
			inRepository: self repository ]