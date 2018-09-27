specs
defaultSpec 
	<spec>

	^ SpecLayout composed
		newColumn: [ :c |
			c 
				newRow: [:row | row add: #urlLabel width: 80 * World displayScaleFactor; add: #urlText ] height: 25 * World displayScaleFactor;
				newRow: [:row | row add: #authorLabel width: 80 * World displayScaleFactor; add: #authorText ] height: 25 * World displayScaleFactor;
				newRow: [:row | row add: #fromLabel width: 80 * World displayScaleFactor; add: #fromText ] height: 25 * World displayScaleFactor;
				newRow: [:row | row add: #toLabel width: 80 * World displayScaleFactor; add: #toText ] height: 25 * World displayScaleFactor;
				newRow: [:row | row add: #mergeableLabel width: 80 * World displayScaleFactor; add: #mergeablePanel ] height: 25 * World displayScaleFactor;
				newRow: [:row | row add: #statusLabel width: 80 * World displayScaleFactor; add: #statusPanel ] height: 25 * World displayScaleFactor;
				newRow: [:row | row add: #checksTable ];
				newRow: [:row | row add: #bodyText ] ];
		yourself