specs
defaultSpec
	<spec>
	^ SpecLayout composed
		newRow: [ :row | 
			row
				add: #mergeButton;
				add: #acceptButton;
				add: #rejectButton ]