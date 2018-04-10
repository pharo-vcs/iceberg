private
chooseUpgradePolicyFor: anIceMetacelloDuplicatedNotification
	^ UIManager default 
		chooseFrom: #(
			'Use INCOMING version' 
			'Use LOADED version')		
		values: { 
			#useIncoming. 
			#useLoaded }
		message: ('There is already a project "{1}" in this image.' format: { self repositoryModel name })
		title: 'Duplicated project!'.
