private factory
createModel
	 ^ IceTipRepositoriesModel new beCached
		announceResetTo: self detachedAnnouncer;
		resetOn: IceRepositoryAnnouncement from: Iceberg announcer;
		yourself