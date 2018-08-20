private
chooseUpgradePolicyProject: projectName optionA: optionA optionB: optionB

	^ UIManager default 
		chooseFrom: {
			'Use INCOMING version {1}' format: { optionA }. 
			'Use LOADED version {1}' format: { optionB } }
		values: { 
			#useIncoming. 
			#useLoaded }
		message: ('There is already a project "{1}" in this installation.' format: { projectName })
		title: 'Duplicated project!'