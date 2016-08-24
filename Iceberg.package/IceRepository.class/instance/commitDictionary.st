commits
commitDictionary
	self branch ensureCommitsLoaded.
	self upstream ifNotNil: #ensureCommitsLoaded.
	^ commitDictionary.
