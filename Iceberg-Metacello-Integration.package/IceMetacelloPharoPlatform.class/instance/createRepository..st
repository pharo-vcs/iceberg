repository creation
createRepository: aRepositorySpec
	(self canHandleType: aRepositorySpec type)
		ifTrue: [ ^ Iceberg mcRepositoryFor: aRepositorySpec description ].

	^ super createRepository: aRepositorySpec