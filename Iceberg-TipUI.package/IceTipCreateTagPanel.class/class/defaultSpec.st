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
				newRow: [ :row | 
					row
						add: #majorButton;
						add: #minorButton;
						add: #patchButton ]
					height: self inputTextHeight;
				newRow: #existingTagsList height: self inputTextHeight * 3;
				newRow: #spacePanel ]