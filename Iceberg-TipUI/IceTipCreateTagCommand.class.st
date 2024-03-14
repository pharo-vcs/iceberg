"
I an a commander command that will be activated on any commitish or repository and ask the selected item to create a tag on itself.
"
Class {
	#name : 'IceTipCreateTagCommand',
	#superclass : 'IceTipCommand',
	#category : 'Iceberg-TipUI-Commands',
	#package : 'Iceberg-TipUI',
	#tag : 'Commands'
}

{ #category : 'accessing - defaults' }
IceTipCreateTagCommand class >> defaultDescription [

	^ 'Creates a tag for the selected commit'
]

{ #category : 'accessing - defaults' }
IceTipCreateTagCommand class >> defaultName [

	^ 'Create tag'
]

{ #category : 'testing' }
IceTipCreateTagCommand >> canBeExecuted [ 

	^ self repositoryModel isNotNil
]

{ #category : 'executing' }
IceTipCreateTagCommand >> execute [

	(IceTipCreateTagPanel 
		newApplication: context application 
		model: self item) 		
		asDialogWindow
			okAction: [ self context refreshTags ];
			centeredRelativeTo: context window;
			open
]

{ #category : 'activation' }
IceTipCreateTagCommand >> iconName [

	^ #glamorousBookmark
]
