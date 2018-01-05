accessing
initialize

	super initialize.
	
	lastFetchTimestamp := self repository branch trackedBranch commit datetime.