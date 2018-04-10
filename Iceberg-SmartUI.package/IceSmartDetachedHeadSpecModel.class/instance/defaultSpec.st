specs
defaultSpec

	^ SpecTableLayout column
		newRow: [ :mainPane | mainPane
			newColumn: [ :restAtLeft |
"							restAtLeft
									add: #descriptionText;
									add: #changesTree;
									add: #changesDiff" ];
			newColumn: [ :branchStatusColumn |
				"branchStatusColumn add: #branchStatusMorph" ] ];
		newRow: [ :row |
			row
				newColumn: [ :statusColumn | 
					"statusColumn add: #status" ];
				newColumn: [ :actionsColumn |
					actionsColumn
						listDirection: #leftToRight;
						hResizing: #shrinkWrap;
						vResizing: #shrinkWrap.
					self actions do: [ :each |
						actionsColumn add: each id ]
					] ] height: 30.