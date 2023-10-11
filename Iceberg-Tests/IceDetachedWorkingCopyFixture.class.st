Class {
	#name : 'IceDetachedWorkingCopyFixture',
	#superclass : 'IceBasicRepositoryFixture',
	#category : 'Iceberg-Tests-Common-Fixtures',
	#package : 'Iceberg-Tests',
	#tag : 'Common-Fixtures'
}

{ #category : 'running' }
IceDetachedWorkingCopyFixture >> setUp [

	| head |
	super setUp.
	repository workingCopy addPackageNamed: packageName1.
	repository commitWithMessage: 'Initial commit'.

	repository workingCopy createClass: 'AClass' inPackage: packageName1.
	repository commitWithMessage: 'Second commit'.

	head:= repository headCommit.
	head parent checkout.
	repository setHead: head.
	
]
