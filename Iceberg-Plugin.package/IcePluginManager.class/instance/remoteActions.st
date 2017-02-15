accessing ui
remoteActions
	^ self plugins 
		inject: #() 
		into: [ :all :each | all, (each remoteActions) ]	
		