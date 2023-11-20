"
I'm a command that makes a working copy to recalculate the dirty packages (via #forceCalculateDirtyPackages).
"
Class {
	#name : 'IceTipCalculateDirtyPackagesCommand',
	#superclass : 'IceTipRepositoryCommand',
	#category : 'Iceberg-TipUI-Commands',
	#package : 'Iceberg-TipUI',
	#tag : 'Commands'
}

{ #category : 'accessing - defaults' }
IceTipCalculateDirtyPackagesCommand class >> defaultName [

	^ 'Recalculate dirty packages'
]

{ #category : 'testing' }
IceTipCalculateDirtyPackagesCommand >> canBeExecuted [

	^ self hasSelectedItem

]

{ #category : 'executing' }
IceTipCalculateDirtyPackagesCommand >> execute [

	IceTipStandardAction new
		repository: self item entity;
		message: 'Recalculating Dirty Packages';
		onSuccessRepositoryModified;
		action: [ self item entity workingCopy forceCalculateDirtyPackages ];
		executeWithContext: context
]

{ #category : 'accessing' }
IceTipCalculateDirtyPackagesCommand >> iconName [

	^ #repair
]
