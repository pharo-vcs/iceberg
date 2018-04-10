private factory
newBaselineGroupCommand: anIcePackage 
	^ IceTipMetacelloInstallBaselineGroupCommand new 
		repositoryModel: self repositoryModel;
		package: anIcePackage;
		yourself