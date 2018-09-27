private
chooseConflictPolicyProject: projectName optionA: optionA optionB: optionB

	^ UIManager default 
		chooseFrom: {
			'Use INCOMING version {1}' format: { optionA }. 
			'Use LOADED version {1}' format: { optionB } }
		values: { 
			#useIncoming. 
			#useLoaded }
		message: ('There are conflicting versions of project "{1}".' format: { projectName })
		title: 'Conflicting project versions'