"
Command that opens a dialog to edit a repository meta-data
"
Class {
	#name : #IceTipEditRepositoryCommand,
	#superclass : #IceTipRepositoryCommand,
	#category : #'Iceberg-TipUI-Commands'
}

{ #category : #accessing }
IceTipEditRepositoryCommand class >> defaultDescription [

	^ 'Edit repository data'
]

{ #category : #accessing }
IceTipEditRepositoryCommand class >> defaultName [

	^ 'Edit...'
]

{ #category : #testing }
IceTipEditRepositoryCommand >> canBeExecuted [

	^ self isRepositoryOperational
]

{ #category : #execution }
IceTipEditRepositoryCommand >> execute [

	self repositoryModel edit
]

{ #category : #accessing }
IceTipEditRepositoryCommand >> iconName [

	^ #edit
]
