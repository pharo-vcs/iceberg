initialization
initializeMessagePanel

	self hasToShowWarning
		ifTrue: [ 
			messagePanel := self instantiate: IceTipReadOnlyTextMorphWithIcon.
			messagePanel iconName: #warning.
			messagePanel text: self warningMessage  ]
		ifFalse: [ 
			messagePanel := self newIcePanel.
			messagePanel widget height: 1 ].
