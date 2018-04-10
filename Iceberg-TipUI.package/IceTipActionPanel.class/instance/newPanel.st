initialization
newPanel
	^ super newPanel
		in: [ :this | this widget listDirection: #rightToLeft];
		yourself