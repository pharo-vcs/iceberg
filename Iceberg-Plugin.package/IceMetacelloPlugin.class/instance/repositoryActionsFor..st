accessing
repositoryActionsFor: aRepository 
	^ ((aRepository savedPackages 
		select: [ :each | each name beginsWith: 'BaselineOf' ])
		sorted: [ :a :b | a name < b name ])
		inject: OrderedCollection new
		into: [ :all :each | 
			all
				add: (self installRepositoryDefaultBaselineAction: each);
				add: (self installRepositoryGroupsBaselineAction: each);
				yourself ]