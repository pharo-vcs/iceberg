specs
defaultSpec
	<spec: #default>

	^ SpecLayout composed 
		newColumn: [ :col | 
			col
				newRow: [ :row | 
						row 
							add: #userNameLabel width: self iceLabelWidth;
							add: #userNameInputText ]
					height: self inputTextHeight;
				newRow: [ :row | 
						row 
							add: #projectNameLabel width: self iceLabelWidth;
							add: #projectNameInputText ]
					height: self inputTextHeight;
				newRow: #projectLocation
					height: self inputTextHeight;
				newRow: [ :row | 
						row 
							add: #protocolLabel width: self iceLabelWidth;
							add: #protocolDropList ]
					height: self inputTextHeight;
				newRow: #spacePanel ]