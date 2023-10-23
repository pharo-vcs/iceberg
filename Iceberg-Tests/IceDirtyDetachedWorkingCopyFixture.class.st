Class {
	#name : 'IceDirtyDetachedWorkingCopyFixture',
	#superclass : 'IceDetachedWorkingCopyFixture',
	#category : 'Iceberg-Tests-Common-Fixtures',
	#package : 'Iceberg-Tests',
	#tag : 'Common-Fixtures'
}

{ #category : 'running' }
IceDirtyDetachedWorkingCopyFixture >> setUp [

	super setUp.
	repository workingCopy createClass: 'AClass' inPackage: packageName1.
]
