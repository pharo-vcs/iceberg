specs
defaultSpec
	<spec: #default>

	^ SpecLayout composed newColumn: [ :col |
		col 
		 	newRow: [:row | row add: #hostLabel width: 80 * World displayScaleFactor; add: #hostInput ] height: self inputTextHeight;
		 	newRow: [:row | row add: #usernameLabel width: 80 * World displayScaleFactor; add: #usernameInput ] height: self inputTextHeight;
			newRow: [:row | row add: #passwordLabel width: 80 * World displayScaleFactor; add: #passwordInput ] height: self inputTextHeight;
			newRow: [:row | ]
	]
