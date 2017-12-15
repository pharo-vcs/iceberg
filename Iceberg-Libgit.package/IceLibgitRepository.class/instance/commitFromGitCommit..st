factory
commitFromGitCommit: aLGitCommit 
	
	^ IceGitCommit new
		id: aLGitCommit id hexString;
		author: aLGitCommit committer name;
		datetime: aLGitCommit time asDateAndTime;
		ancestorIds: (aLGitCommit parents collect: [ :parent | parent id hexString ]);
		comment: aLGitCommit message