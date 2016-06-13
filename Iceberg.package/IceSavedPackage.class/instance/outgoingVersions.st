querying
outgoingVersions
	^ self versions select: [ :version | self repository outgoingCommits includes: version commit ]