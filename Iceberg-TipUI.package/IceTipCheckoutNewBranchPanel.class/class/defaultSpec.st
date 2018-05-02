specs
defaultSpec
	<spec: #default>

	^ SpecLayout composed 
		newColumn: [ :col | 
			col
				newRow: #currentBranchLabel height: self inputTextHeight;
				newRow: [ :row | 
						row 
							add: #branchLabel width: self iceLabelWidth;
							add: #branchInputText ]
					height: self inputTextHeight;
				newRow: #spacePanel ]