settings
settingsAddButton
	^ PluggableButtonMorph
		on: self
		getState: #settingsAddButtonState
		action: #settingsAddButtonAction
		label: #settingsAddButtonActionLabel