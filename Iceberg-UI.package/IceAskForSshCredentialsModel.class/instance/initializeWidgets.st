initialization
initializeWidgets
	usernameLabel := self newLabel label: 'SSH Username: '.
	usernameInput := self newTextInput autoAccept: true.
	
	publicKeyLocation := self instantiate: IceTipFilePresenter.
	publicKeyLocation 
		label: 'Public SSH Key: ';
		chooseTitle: 'Public SSH Key (id_rsa.pub)'.

	privateKeyLocation := self instantiate: IceTipFilePresenter.
	privateKeyLocation 
		label: 'Private SSH Key: ';
		chooseTitle: 'Private SSH Key (id_rsa)'.

	passwordLabel := self newLabel label: 'SSH Passphrase: '.
	passwordInput := self newTextInput beEncrypted; autoAccept: true.

	storeCheckbox := self newCheckBox
		label: 'Do you want this credentials to be stored for future use?';
		state: true.
	
	self focusOrder
		add: usernameInput;
		add: publicKeyLocation;
		add: privateKeyLocation;
		add: passwordInput;
		add: storeCheckbox
