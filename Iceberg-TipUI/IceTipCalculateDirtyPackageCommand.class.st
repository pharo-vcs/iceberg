"
I'm a command that makes a working copy to recalculate the dirty packages (via #forceCalculateDirtyPackages).
"
Class {
	#name : 'IceTipCalculateDirtyPackageCommand',
	#superclass : 'IceTipRepositoryCommand',
	#category : 'Iceberg-TipUI-Commands',
	#package : 'Iceberg-TipUI',
	#tag : 'Commands'
}

{ #category : 'accessing - defaults' }
IceTipCalculateDirtyPackageCommand class >> defaultName [

	^ 'Recalculate one dirty package'
]

{ #category : 'testing' }
IceTipCalculateDirtyPackageCommand >> canBeExecuted [

	^ self hasSelectedItem

]

{ #category : 'executing' }
IceTipCalculateDirtyPackageCommand >> execute [

	IceTipStandardAction new
		repository: self item entity;
		message: 'Recalculating The Dirty Package';
		onSuccessRepositoryModified;
		action: [ self item entity workingCopy forceCalculateOneDirtyPackage: self item entity ];
		executeWithContext: context
]

{ #category : 'accessing' }
IceTipCalculateDirtyPackageCommand >> iconName [

	^ #repair
]
