specs
defaultSpec 
	<spec>

	^ SpecLayout composed
		newColumn: [ :c |
			c 
				newRow: [:row | row add: #titleLabel width: 80; add: #titlePanel ] height: 25;
				newRow: [:row | 
					row 
						add: #headLabel width: 80; 
						add: #headForkList width: 200;
						add: #headBranchList ] height: 25;
				newRow: [:row | 
					row 
						add: #baseLabel width: 80; 
						add: #baseForkList width: 200;
						add: #baseBranchList ] height: 25;
				newRow: [:row | row add: #bodyLabel width: 80; add: #bodyPanel ];
				add: #addButton height: self buttonHeight  ];
		yourself