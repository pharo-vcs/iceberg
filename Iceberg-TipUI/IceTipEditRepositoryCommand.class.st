"
Command that opens a dialog to edit a repository meta-data
"
Class {
	#name : 'IceTipEditRepositoryCommand',
	#superclass : 'IceTipRepositoryCommand',
	#category : 'Iceberg-TipUI-Commands',
	#package : 'Iceberg-TipUI',
	#tag : 'Commands'
}

{ #category : 'accessing - defaults' }
IceTipEditRepositoryCommand class >> defaultDescription [

	^ 'Edit repository data'
]

{ #category : 'accessing - defaults' }
IceTipEditRepositoryCommand class >> defaultName [

	^ 'Edit...'
]

{ #category : 'testing' }
IceTipEditRepositoryCommand >> canBeExecuted [

	^ super canBeExecuted and: [ self isRepositoryOperational ]
]

{ #category : 'executing' }
IceTipEditRepositoryCommand >> execute [

	self flag: #TODO. "Demeter's law"
	((IceTipEditProjectDialogPresenter 
		newApplication: context application 
		model: self repositoryModel entity project) 
		asDialogWindow)
			centeredRelativeTo: context window;
			open
]

{ #category : 'accessing' }
IceTipEditRepositoryCommand >> iconName [

	^ #edit
]
