querying
isLoaded
	^ (self repository incommingCommits includes: self) not