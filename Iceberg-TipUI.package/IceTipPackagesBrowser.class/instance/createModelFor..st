private factory
createModelFor: aRepositoryModel
	^ (IceTipPackagesModel for: aRepositoryModel) beCached
		resetOn: IceRepositoryAnnouncement 
			condition: [ :this :ann | this repository = ann repository ] 
			from: Iceberg announcer;
		yourself