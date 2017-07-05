specs
defaultSpec 
	<spec>

	^ SpecLayout composed
		newColumn: [ :c |
			c 
				newRow: [:row | row add: #urlLabel width: 80; add: #urlText ] height: 25;
				newRow: [:row | row add: #authorLabel width: 80; add: #authorText ] height: 25;
				newRow: [:row | row add: #mergeableLabel width: 80; add: #mergeableText ] height: 25;
				newRow: [:row | row add: #statusLabel width: 80; add: #statusPanel ] height: 25;
				newRow: [:row | row add: #checksLabel width: 80; add: #checksTable ];
				newRow: [:row | row add: #bodyLabel width: 80; add: #bodyText ] ];
		yourself