initialization
putFocusOrder
	self focusOrder
		add: usernameInput;
		add: publicKeyInput locationInput;
		add: privateKeyInput locationInput;
		add: passphraseInput;
		add: storeCheckbox