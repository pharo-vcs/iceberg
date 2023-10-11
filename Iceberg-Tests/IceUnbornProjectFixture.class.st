Class {
	#name : 'IceUnbornProjectFixture',
	#superclass : 'IceSinglePackageFixture',
	#category : 'Iceberg-Tests-Common-Fixtures',
	#package : 'Iceberg-Tests',
	#tag : 'Common-Fixtures'
}

{ #category : 'running' }
IceUnbornProjectFixture >> isUnbornProjectFixture [

	^ true
]

{ #category : 'running' }
IceUnbornProjectFixture >> setUp [

	super setUp.
	repository workingCopy project: repository newUnbornProject.
	repository commitWithMessage: 'Remove project file'.
	repository workingCopy refreshProjectFromRepository.
]
