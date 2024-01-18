"
I register Iceberg projects.
I will open a dialog to take the new possible repository (from available options) and I will register it into the IceRepository>>#registry list.
"
Class {
	#name : 'IceTipAddRepositoryCommand',
	#superclass : 'IceTipRepositoryCommand',
	#category : 'Iceberg-TipUI-Commands',
	#package : 'Iceberg-TipUI',
	#tag : 'Commands'
}

{ #category : 'accessing - defaults' }
IceTipAddRepositoryCommand class >> defaultDescription [

	^ 'Add a repository (new, local, cloned) to your managed repositories.'
]

{ #category : 'accessing - defaults' }
IceTipAddRepositoryCommand class >> defaultName [

	^ 'Add'
]

{ #category : 'testing' }
IceTipAddRepositoryCommand >> canBeExecuted [ 
	
	"This command can be executed with our without selection"
	^ true
]

{ #category : 'executing' }
IceTipAddRepositoryCommand >> execute [

	(IceTipRegisterRepositoryDialogPresenter newApplication: context application)	
		asDialogWindow 
			centeredRelativeTo: context window;
			open
]

{ #category : 'accessing' }
IceTipAddRepositoryCommand >> iconName [

	^ #add
]

{ #category : 'accessing' }
IceTipAddRepositoryCommand >> shortcutKey [

	^ $n meta
]

{ #category : 'testing' }
IceTipAddRepositoryCommand >> shouldBeDisplayedOnRightSideInToolbar [

	^ true
]
