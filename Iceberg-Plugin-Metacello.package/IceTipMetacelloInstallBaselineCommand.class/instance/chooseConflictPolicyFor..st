private
chooseConflictPolicyFor: aMetacelloUpgradeRequest
 
	^ UIManager default 
		chooseFrom: {
			'Use INCOMING version {1}' format: { aMetacelloUpgradeRequest newProjectRegistration printString }. 
			'Use LOADED version {1}' format: { aMetacelloUpgradeRequest existingProjectRegistration printString } }
		values: { 
			#useIncoming. 
			#useLoaded }
		message: ('There are conflicting versions of project "{1}".' format: { aMetacelloUpgradeRequest projectName })
		title: 'Conflicting project versions'.
