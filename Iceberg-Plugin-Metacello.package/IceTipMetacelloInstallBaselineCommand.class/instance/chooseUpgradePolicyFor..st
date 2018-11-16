private
chooseUpgradePolicyFor: aMetacelloUpgradeRequest
 
	^ UIManager default 
		chooseFrom: {
			'Use INCOMING version {1}' format: { aMetacelloUpgradeRequest newProjectRegistration printString }. 
			'Use LOADED version {1}' format: { aMetacelloUpgradeRequest existingProjectRegistration printString } }
		values: { 
			#useIncoming. 
			#useLoaded }
		message: ('There is already a project "{1}" in this installation.' format: { aMetacelloUpgradeRequest projectName })
		title: 'Duplicated project!'.
