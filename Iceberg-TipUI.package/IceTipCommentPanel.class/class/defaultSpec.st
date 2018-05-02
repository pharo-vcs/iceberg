specs
defaultSpec
	<spec: #default>
	^ SpecLayout composed
		newColumn: [ :column |
			column 
				newRow: #pushCheckbox height: self inputTextHeight;
				newRow: #commentText;
				newRow: #actionPanel height: self iceActionPanelHeight ]