specs
defaultSpec
	<spec: #default>
	^ SpecLayout composed
		newColumn: [ :col | 
			col
				newRow: #currentBranchLabel height: self inputTextHeight;
				newRow: [ :row | 
					row
						add: #branchLabel width: self labelWidth;
						add: #issueNumberText width: 50;
						add: #issueText ]
					height: self inputTextHeight;
				newRow: #spacePanel ]