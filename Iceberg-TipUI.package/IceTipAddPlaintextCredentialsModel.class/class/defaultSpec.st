specs
defaultSpec
	<spec: #default>

	^ SpecLayout composed newColumn: [ :col |
		col 
		 	newRow: [:row | row add: #hostLabel width: 80; add: #hostInput ] height: self inputTextHeight;
		 	newRow: [:row | row add: #usernameLabel width: 80; add: #usernameInput ] height: self inputTextHeight;
			newRow: [:row | row add: #passwordLabel width: 80; add: #passwordInput ] height: self inputTextHeight;
			newRow: [:row | ]
	]
