Class {
	#name : #IceTipCalculateDirtyPackagesCommand,
	#superclass : #IceTipRepositoryCommand,
	#category : #'Iceberg-TipUI-Commands'
}

{ #category : #accessing }
IceTipCalculateDirtyPackagesCommand class >> defaultName [

	^ 'Recalculate dirty packages'
]

{ #category : #testing }
IceTipCalculateDirtyPackagesCommand >> canBeExecuted [

	^ self hasSelectedItem

]

{ #category : #execution }
IceTipCalculateDirtyPackagesCommand >> execute [

	IceTipStandardAction new
		repository: self item entity;
		message: 'Recalculating Dirty Packages';
		onSuccessRepositoryModified;
		execute: [
			self item entity workingCopy forceCalculateDirtyPackages ]

]

{ #category : #accessing }
IceTipCalculateDirtyPackagesCommand >> iconName [

	^ #repair
]
