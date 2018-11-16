initialization
initializeWidgets
	super initializeWidgets.

	usernameLabel := self newLabel label: 'Username: '.
	usernameInput := self newTextInput
		text: 'git';
		autoAccept: true;
		whenTextChanged: [ self updateOkButton ];
		yourself.

	passphraseLabel := self newLabel label: 'Key Passphrase: '.
	passphraseInput := self newTextInput
		beEncrypted;
		autoAccept: true;
		whenTextChanged: [ self updateOkButton ];
		yourself.
		
	privateKeyInput := IceTipFilePresenter new 
		label: 'Private Key';
		onChoose: [ self updateOkButton ];
		chooseTitle: 'Select Private Key';
		whenTextChanged: [ self updateOkButton ];
		yourself.
		
	publicKeyInput := IceTipFilePresenter new 
		label: 'Public Key';
		onChoose: [ self updateOkButton ];
		chooseTitle: 'Select Public Key';
		whenTextChanged: [ self updateOkButton ];		
		yourself.	