specs
defaultSpec
	<spec: #default>

	^ SpecLayout composed 
		newColumn: [ :col | 
			col
				newRow: [ :row | 
						row 
							add: #remoteLabel width: self iceLabelWidth;
							add: #remoteInputText ]
					height: self inputTextHeight;
				newRow: #projectLocation
					height: self inputTextHeight;
				newRow: [ :row | 
						row 
							add: #subdirectoryLabel width: self iceLabelWidth;
							add: #subdirectoryInputText ]
					height: self inputTextHeight;
				newRow: #spacePanel ]