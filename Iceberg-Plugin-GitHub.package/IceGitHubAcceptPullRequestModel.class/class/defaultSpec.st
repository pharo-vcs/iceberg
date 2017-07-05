specs
defaultSpec 
	<spec>

	^ SpecLayout composed
		newColumn: [ :col |
			col 
				newRow: [:row | row add: #messageLabel width: 80; add: #messageText ];
				newRow: [:row | row add: #typeLabel width: 80; add: #typeList ] height: 25;
				add: #acceptButton height: self buttonHeight  ];
		yourself