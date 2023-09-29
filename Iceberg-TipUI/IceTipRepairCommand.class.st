"
Command that opens the repair window on a repository
"
Class {
	#name : 'IceTipRepairCommand',
	#superclass : 'IceTipRepositoryCommand',
	#category : 'Iceberg-TipUI-Commands',
	#package : 'Iceberg-TipUI',
	#tag : 'Commands'
}

{ #category : 'accessing - defaults' }
IceTipRepairCommand class >> defaultDescription [

	^ 'Helps you to repair your repository when it is detached.'
]

{ #category : 'accessing - defaults' }
IceTipRepairCommand class >> defaultName [

	^ 'Repair repository'
]

{ #category : 'accessing - defaults' }
IceTipRepairCommand class >> defaultToolbarItemName [

	^ 'Repair'
]

{ #category : 'testing' }
IceTipRepairCommand >> canBeExecuted [

	^ super canBeExecuted and: [ self isRepositoryOperational not ]
]

{ #category : 'executing' }
IceTipRepairCommand >> execute [

	((IceTipRepairRepositoryDialogPresenter 
		newApplication: context application
		model: self repositoryModel)
		asDialogWindow)
			centeredRelativeTo: context window;
			open
]

{ #category : 'accessing' }
IceTipRepairCommand >> iconName [

	^ #repair
]
