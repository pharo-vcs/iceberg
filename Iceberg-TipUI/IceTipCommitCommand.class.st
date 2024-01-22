"
I open a the commit window, with all latest changes.
"
Class {
	#name : 'IceTipCommitCommand',
	#superclass : 'IceTipRepositoryCommand',
	#category : 'Iceberg-TipUI-Commands',
	#package : 'Iceberg-TipUI',
	#tag : 'Commands'
}

{ #category : 'accessing - defaults' }
IceTipCommitCommand class >> defaultDescription [

	^ 'Commit changes to this repository'
]

{ #category : 'accessing - defaults' }
IceTipCommitCommand class >> defaultName [

	^ 'Commit'
]

{ #category : 'testing' }
IceTipCommitCommand >> canBeExecuted [

	^ self isRepositoryOperational
]

{ #category : 'executing' }
IceTipCommitCommand >> execute [

	(IceTipCommitBrowser 
		newApplication: context application 
		model: context workingCopyModel) 
		open
]

{ #category : 'accessing' }
IceTipCommitCommand >> iconName [

	^ #smallOk
]

{ #category : 'accessing' }
IceTipCommitCommand >> shortcutKey [

	^ $s meta
]
