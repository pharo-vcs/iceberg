initialization
initializeStatusBar
	statusBar addItem: (IceTipStatusBarValueHolder new 
		target: self model;
		contents: #status;
		yourself)