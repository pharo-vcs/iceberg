private factory
newBaselineDefaultCommand: anIcePackage 
	^ IceTipMetacelloInstallBaselineDefaultCommand new 
		repositoryModel: self repositoryModel;
		package: anIcePackage;
		yourself