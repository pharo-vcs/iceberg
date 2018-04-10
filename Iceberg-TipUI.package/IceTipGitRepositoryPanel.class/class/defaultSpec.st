specs
defaultSpec
	<spec: #default>

	^ SpecLayout composed 
		newColumn: [ :col | 
			col
				newRow: [ :row | 
						row 
							add: #remoteLabel width: self labelWidth;
							add: #remoteInputText ]
					height: self inputTextHeight;
				newRow: #projectLocation
					height: self inputTextHeight;
				newRow: [ :row | 
						row 
							add: #subdirectoryLabel width: self labelWidth;
							add: #subdirectoryInputText ]
					height: self inputTextHeight;
				newRow: #spacePanel ]