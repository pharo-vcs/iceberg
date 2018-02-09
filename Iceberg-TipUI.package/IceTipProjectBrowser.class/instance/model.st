accessing
model
	^ model ifNil: [ 
		model := IceTipProjectsModel new beCached
			announceResetTo: self detachedAnnouncer;
			resetOn: IceRepositoryAnnouncement from: Iceberg announcer;
			yourself ]