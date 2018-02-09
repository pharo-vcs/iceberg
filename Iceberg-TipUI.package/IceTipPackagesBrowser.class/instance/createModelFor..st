private factory
createModelFor: aProjectModel
	^ (IceTipPackagesModel for: aProjectModel) beCached
		resetOn: IceRepositoryAnnouncement 
			condition: [ :this :ann | this repository = ann repository ] 
			from: Iceberg announcer;
		yourself