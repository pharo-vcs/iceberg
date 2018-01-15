private accessing
visibleRepositoryModels
	^ self repositoryRegistry collect: [ :repo | IceRepositoryModel modelFor: repo ]