initialization
newIcePanel
	^ super newIcePanel
		in: [ :this | this widget listDirection: #rightToLeft];
		yourself