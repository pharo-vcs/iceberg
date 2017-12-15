accessing
refreshTo: aCommitInfo
	self branch refresh.
	self loadedCode refreshTo: aCommitInfo.
	commitDictionary := Dictionary new.
	savedPackages := nil.
	self announcer announce: (IceRepositoryModified for: self)