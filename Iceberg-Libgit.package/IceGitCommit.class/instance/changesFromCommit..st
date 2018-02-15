API-changes
changesFromCommit: anIceGitCommit 
	|  files |
	files := self repository changedFilesBetween: anIceGitCommit and: self.
	^ files collect: [ :each | IceGitChange on: each ]