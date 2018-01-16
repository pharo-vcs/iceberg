factory
commitFromGitCommit: aLGitCommit 
	
	^ IceGitCommit new
		id: aLGitCommit id hexString;
		author: aLGitCommit author name;
		datetime: aLGitCommit time asDateAndTime;
		ancestorIds: (aLGitCommit parents collect: [ :parent | parent id hexString ]);
		comment: aLGitCommit message;
		repository: self;
		yourself