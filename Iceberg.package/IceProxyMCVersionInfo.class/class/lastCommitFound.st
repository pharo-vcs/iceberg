private
lastCommitFound
	^ self cachedValues at: #lastCommit ifAbsent: [ nil ]