specs
defaultSpec 
	<spec>

	^ SpecLayout composed
		newColumn: [ :c |
			c 
				newRow: [:row | row add: #titleLabel width: 80; add: #titlePanel ] height: 25;
				newRow: [:row | row add: #headLabel width: 80; add: #headPanel ] height: 25;
				newRow: [:row | row add: #baseLabel width: 80; add: #basePanel ] height: 25;
				newRow: [:row | row add: #bodyLabel width: 80; add: #bodyPanel ];
				add: #addButton height: self buttonHeight  ];
		yourself