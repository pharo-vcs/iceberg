accessing ui
repositoryActionsFor: aRepository 
	^ self plugins 
		inject: #() 
		into: [ :all :each | all, (each repositoryActionsFor: aRepository) ]	
		