specs
defaultSpec
	<spec: #default>

	^ SpecLayout composed 
		newColumn: [ :col | 
			col
				newRow: #currentCommitishLabel height: self inputTextHeight;
				newRow: [ :row | 
						row 
							add: #tagNameLabel width: self iceLabelWidth;
							add: #tagNameInputText ]
					height: self inputTextHeight;
				newRow: #spacePanel ]