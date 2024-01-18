Class {
	#name : 'IceCleanWorkingCopyFixture',
	#superclass : 'IceBasicRepositoryFixture',
	#category : 'Iceberg-Tests-Common-Fixtures',
	#package : 'Iceberg-Tests',
	#tag : 'Common-Fixtures'
}

{ #category : 'running' }
IceCleanWorkingCopyFixture >> setUp [

	super setUp.
	repository workingCopy addPackageNamed: packageName1.
	repository workingCopy addPackageNamed: packageName2.
	repository commitWithMessage: 'Local commit'.
	repository checkoutAllPackages.
]
