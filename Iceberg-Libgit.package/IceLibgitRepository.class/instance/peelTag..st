private-tags
peelTag: anIceTag 
	self handleLibgitError: [ | lgitRef |
		lgitRef := (self repositoryHandle lookup: 'refs/tags/', anIceTag name).
		^ self lookupCommit: lgitRef targetId hexString ]