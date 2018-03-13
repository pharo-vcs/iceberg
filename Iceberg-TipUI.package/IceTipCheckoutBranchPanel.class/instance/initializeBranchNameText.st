initialization
initializeBranchNameText
	self branchNameText whenBuiltDo: [ :ann |
		ann widget 
			bindKeyCombination: Character arrowUp asKeyCombination 
				toAction: [ 
					self branchesList takeKeyboardFocus.
					self branchesList widget selectLastVisibleRow ];
			bindKeyCombination: Character arrowDown asKeyCombination 
				toAction: [ 
					self branchesList takeKeyboardFocus.
					self branchesList widget selectFirstVisibleRow ] ]