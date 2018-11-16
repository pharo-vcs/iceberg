specs
defaultSpec
	<spec: #default>

	^ SpecLayout composed
		newColumn: [ :col | 
			col
				newRow: #currentBranchLabel height: self inputTextHeight;
				newRow: [ :row | 
					row
						newColumn: #branchLabel width: self iceLabelWidth;
						newColumn: #issueNumberText ]
					height: self inputTextHeight;
				newRow: [ :row |
					row 
						newColumn: #issueLabel width: self iceLabelWidth;
						newColumn: #issueText ] 
					height: self inputTextHeight;
				newRow: #spacePanel ]