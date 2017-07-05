specs
defaultSpec 
	<spec>

	^ SpecLayout composed
		newColumn: [ :col |
			col 
				newRow: [:row | row add: #messageLabel width: 80; add: #messageText ];
				add: #acceptButton height: self buttonHeight  ];
		yourself