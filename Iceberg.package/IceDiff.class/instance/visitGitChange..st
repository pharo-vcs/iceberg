visiting
visitGitChange: anIceGitChange 
	
	^ anIceGitChange accept: (IceDiffNodeBuilder new
		diff: self;
		parentNode: tree;
		yourself)