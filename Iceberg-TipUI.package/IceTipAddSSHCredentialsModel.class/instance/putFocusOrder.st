initialization
putFocusOrder
	self focusOrder
		add: hostInput;
		add: usernameInput;
		add: publicKeyInput locationInput;
		add: privateKeyInput locationInput;
		add: passphraseInput;
		add: storeCheckbox