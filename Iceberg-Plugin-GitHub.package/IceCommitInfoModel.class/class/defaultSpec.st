specs
defaultSpec 
	<spec>

	^ SpecLayout composed
		newColumn: [ :c |
			c 
				newRow: [:row | row add: #dateLabel width: 80 * World displayScaleFactor; add: #datePanel ] height: 25 * World displayScaleFactor;
				newRow: [:row | row add: #idLabel width: 80 * World displayScaleFactor; add: #idPanel ] height: 25 * World displayScaleFactor;
				newRow: [:row | row add: #parentsLabel width: 80 * World displayScaleFactor; add: #parentsPanel ] height: 25 * World displayScaleFactor;
				newRow: [:row | row add: #authorLabel width: 80 * World displayScaleFactor; add: #authorPanel ] height: 25 * World displayScaleFactor;
				newRow: [:row | row add: #commentLabel width: 80 * World displayScaleFactor; add: #commentPanel ] ];
		yourself