building
ensureOrganization: aCollection 
	
	^ organizationChange ifNil: [ organizationChange := IcePackageOrganizationDiff new
		parent: self;
		yourself. ]