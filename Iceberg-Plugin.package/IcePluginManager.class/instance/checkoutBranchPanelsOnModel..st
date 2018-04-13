accessing ui
checkoutBranchPanelsOnModel: aModel 

	^ self plugins
		inject: #() 
		into: [ :all :each | all, (each checkoutBranchPanelsOnModel: aModel ) ]