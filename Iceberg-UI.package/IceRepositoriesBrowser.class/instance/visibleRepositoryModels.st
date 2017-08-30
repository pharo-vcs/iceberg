private accessing
visibleRepositoryModels
	^ self repositoryRegistry 
		select: [ :each | self isRepositoryVisible: each  ]
		thenCollect: [ :repo | IceRepositoryModel modelFor: repo ]