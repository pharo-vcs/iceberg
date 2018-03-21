initialization
initializePackageNameText
	self packageNameText whenBuiltDo: [ :ann |
		ann widget 
			bindKeyCombination: Character enter asKeyCombination 
				toAction: [ self accept ];
			bindKeyCombination: Character arrowUp asKeyCombination 
				toAction: [ 
					self packagesList takeKeyboardFocus.
					self packagesList widget selectLastVisibleRow ];
			bindKeyCombination: Character arrowDown asKeyCombination 
				toAction: [ 
					self packagesList takeKeyboardFocus.
					self packagesList widget selectFirstVisibleRow ] ]