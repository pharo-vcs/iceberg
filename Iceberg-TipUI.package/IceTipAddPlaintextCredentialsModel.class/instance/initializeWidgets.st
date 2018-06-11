initialization
initializeWidgets

	super initializeWidgets.

	hostLabel := self newLabel label: 'Host: '.
	hostInput := self newTextInput 
		autoAccept: true;
		whenTextChanged: [ self updateOkButton ];
		yourself.

