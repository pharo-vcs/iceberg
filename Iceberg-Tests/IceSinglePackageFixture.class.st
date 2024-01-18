Class {
	#name : 'IceSinglePackageFixture',
	#superclass : 'IceBasicRepositoryFixture',
	#category : 'Iceberg-Tests-Common-Fixtures',
	#package : 'Iceberg-Tests',
	#tag : 'Common-Fixtures'
}

{ #category : 'running' }
IceSinglePackageFixture >> setUp [

	super setUp.
	repository workingCopy addPackageNamed: packageName1.
	repository commitWithMessage: 'Initial commit'.
]
