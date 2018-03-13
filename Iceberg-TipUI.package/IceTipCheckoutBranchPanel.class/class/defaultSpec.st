specs
defaultSpec
	<spec: #default>
	
	^ SpecLayout composed 
		newColumn: [ :column |
			column 
				newRow: #branchesList;
				newRow: #branchNameText height: self inputTextHeight ]