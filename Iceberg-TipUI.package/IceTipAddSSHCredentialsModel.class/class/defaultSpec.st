specs
defaultSpec
	<spec: #default>

	^ SpecLayout composed newColumn: [ :col |
		col 
		 	newRow: [:row | row add: #hostLabel width: self iceLabelWidth; add: #hostInput ] height: self inputTextHeight;
		 	newRow: [:row | row add: #usernameLabel width: self iceLabelWidth; add: #usernameInput ] height: self inputTextHeight;
			newRow: [:row | row add: #publicKeyInput ] height: self inputTextHeight;
			newRow: [:row | row add: #privateKeyInput ] height: self inputTextHeight;
			newRow: [:row | row add: #passphraseLabel width: self iceLabelWidth; add: #passphraseInput ] height: self inputTextHeight;
			newRow: [:row | ]
	]
