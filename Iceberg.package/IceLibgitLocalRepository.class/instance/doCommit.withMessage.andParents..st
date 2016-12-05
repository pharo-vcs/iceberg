private
doCommit: versions withMessage: message andParents: parentCommitsBlock
	| indexOid |
	indexOid := self addFilesToIndex: (versions collect: [ :version | self directoryForPackage: version package]).
	^ self doCommitIndex: indexOid withMessage: message andParents: parentCommitsBlock