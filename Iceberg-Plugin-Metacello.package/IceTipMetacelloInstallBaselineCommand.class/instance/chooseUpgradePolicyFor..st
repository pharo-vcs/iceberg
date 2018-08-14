private
chooseUpgradePolicyFor: aMetacelloUpgradeRequest
	| projectName optionA optionB context |

	context := IceMetacelloLoadSessionContext value.
	projectName := aMetacelloUpgradeRequest projectName.
	optionA := aMetacelloUpgradeRequest newProjectRegistration printString.
	optionB := aMetacelloUpgradeRequest existingProjectRegistration printString.
	
	^ context 
		recordChoiceProject: projectName 
		optionA: optionA 
		optionB: optionB
		ifAbsentAnswer: [ 				
			self 
				chooseUpgradePolicyProject: projectName 
				optionA: optionA 
				optionB: optionB ]