specs
defaultSpec
	^ SpecLayout composed
		newColumn: [ :mainC | 
			mainC
				newRow: [ :row | 
					row
						newColumn: [ :column | 
							column
								newRow: #commitLabel height: self labelHeight;
								newRow: #commits ] ];
				addHSplitter;
				newRow: [ :row | row add: #diff ];
				newRow: [ :row | 
					row
						add: #mergeButton;
						add: #acceptButton;
						add: #rejectButton ] height: self toolbarHeight ];
		yourself