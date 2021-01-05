"
Command that opens the repair window on a repository
"
Class {
	#name : #IceTipRepairCommand,
	#superclass : #IceTipRepositoryCommand,
	#category : #'Iceberg-TipUI-Commands'
}

{ #category : #accessing }
IceTipRepairCommand class >> defaultDescription [

	^ 'Helps you to repair your repository when it is detached.'
]

{ #category : #accessing }
IceTipRepairCommand class >> defaultName [

	^ 'Repair repository'
]

{ #category : #accessing }
IceTipRepairCommand class >> defaultToolbarItemName [

	^ 'Repair'
]

{ #category : #testing }
IceTipRepairCommand >> canBeExecuted [

	^ self isRepositoryOperational not
]

{ #category : #execution }
IceTipRepairCommand >> execute [

	(IceTipRepairRepositoryDialog on: self repositoryModel)
		openDialogWithSpec
]

{ #category : #accessing }
IceTipRepairCommand >> iconName [

	^ #repair
]
