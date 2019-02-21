"
Command that checks out the selected tag
"
Class {
	#name : #IceTipCheckoutSelectedTagCommand,
	#superclass : #IceTipRepositoryCommand,
	#instVars : [
		'tagModel'
	],
	#category : 'Iceberg-TipUI-Commands'
}

{ #category : #testing }
IceTipCheckoutSelectedTagCommand class >> actsOnTag: aRemoteModel [
	^ true
]

{ #category : #execution }
IceTipCheckoutSelectedTagCommand class >> browserContextActivation [
    <classAnnotation>
    
	^ CmdContextMenuActivation 
		byRootGroupItemOrder: 80
		for: IceTipRepositoryContext
]

{ #category : #execution }
IceTipCheckoutSelectedTagCommand class >> canBeExecutedInContext: aToolContext [
    ^ aToolContext item canActivateCommand: self
]

{ #category : #accessing }
IceTipCheckoutSelectedTagCommand class >> defaultHelp [
	^ 'Checkout this tag for this repository. Repository will then be in Detached Head state!'
]

{ #category : #accessing }
IceTipCheckoutSelectedTagCommand class >> defaultMenuIconName [
	^ #checkout
]

{ #category : #accessing }
IceTipCheckoutSelectedTagCommand class >> defaultMenuItemName [
	^ 'Checkout tag'
]

{ #category : #execution }
IceTipCheckoutSelectedTagCommand >> execute [
	tagModel previewCheckout
]

{ #category : #execution }
IceTipCheckoutSelectedTagCommand >> readParametersFromContext: aToolContext [
	super readParametersFromContext: aToolContext.
	tagModel := aToolContext item.
]
