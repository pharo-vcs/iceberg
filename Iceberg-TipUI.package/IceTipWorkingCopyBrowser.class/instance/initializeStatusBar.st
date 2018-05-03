initialization
initializeStatusBar
	statusBar 
		addItem: (IceTipBranchWithCommitStatusBarItem new
			model: self model;
			yourself);
		addItem: (IceTipStatusBarTargetItem new 
			bePositionRight;
			target: self model;
			contents: #status;
			yourself)