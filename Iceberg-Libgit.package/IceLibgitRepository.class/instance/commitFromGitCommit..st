private-commits
commitFromGitCommit: aLGitCommit 
	
	^ self commitCache at: aLGitCommit id hexString ifAbsentPut: [ 
		IceGitCommit new
			id: aLGitCommit id hexString;
			author: aLGitCommit author name asByteArray utf8Decoded;
			datetime: aLGitCommit time asDateAndTime;
			ancestorIds: (aLGitCommit parents collect: [ :parent | parent id hexString ]);
			comment: aLGitCommit message;
			repository: self;
			yourself ]