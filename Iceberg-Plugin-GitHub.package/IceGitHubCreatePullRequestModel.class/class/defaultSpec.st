specs
defaultSpec 
	<spec>

	^ SpecLayout composed
		newColumn: [ :col |
			col 
				newRow: [:row | row add: #titleLabel width: 80 * World displayScaleFactor; add: #titlePanel ] height: 25 * World displayScaleFactor;
				newRow: [:row | 
					row 
						newColumn: #headLabel width: 80 * World displayScaleFactor;
						newColumn: [ :col2 | 
							col2 newRow: [ :row2 | 
								row2
									add: #headForkList;
									add: #headBranchList ] ] ] height: 25 * World displayScaleFactor;
				newRow: [:row | 
					row 
						newColumn: #baseLabel width: 80 * World displayScaleFactor;
						newColumn: [ :col2 |
							col2 newRow: [ :row2 |
								row2 
									add: #baseForkList;
									add: #baseBranchList ] ] ] height: 25 * World displayScaleFactor;
				newRow: [:row | row add: #bodyLabel width: 80 * World displayScaleFactor; add: #bodyPanel ];
				add: #addButton height: self buttonHeight  ];
		yourself