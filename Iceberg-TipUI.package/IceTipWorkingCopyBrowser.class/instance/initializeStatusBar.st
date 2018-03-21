initialization
initializeStatusBar
	statusBar 
		addItem: (IceTipStatusBarTargetItem new
			target: self model;
			contents: #branchName;
			yourself);
		addItem: (IceTipStatusBarTargetItem new 
			bePositionRight;
			target: self model;
			contents: #status;
			yourself)