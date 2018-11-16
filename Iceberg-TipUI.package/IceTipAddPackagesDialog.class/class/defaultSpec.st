specs
defaultSpec
	<spec: #default>
	
	^ SpecLayout composed 
		newColumn: [ :column |
			column 
				newRow: #packagesList;
				newRow: #packageNameText height: self inputTextHeight ]