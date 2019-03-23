initialization
initializeWidgets
	super initializeWidgets.
	tokenLabel := self newLabel label: 'OTP Token: '.
	tokenInput := self newTextInput
		beInvisible;
		autoAccept: true;
		whenTextChangedDo: [ self updateOkButton ];
		yourself