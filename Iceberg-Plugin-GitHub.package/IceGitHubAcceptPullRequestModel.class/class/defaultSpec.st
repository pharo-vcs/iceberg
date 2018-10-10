specs
defaultSpec 
	<spec>

	^ SpecLayout composed
		newColumn: [ :col |
			col 
				newRow: [:row | row add: #messageLabel width: 80 * World displayScaleFactor; add: #messageText ];
				newRow: [:row | row add: #typeLabel width: 80 * World displayScaleFactor; add: #typeList ] height: 25 * World displayScaleFactor;
				add: #acceptButton height: self buttonHeight  ];
		yourself