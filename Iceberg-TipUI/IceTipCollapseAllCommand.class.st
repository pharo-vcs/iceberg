"
I am a command to collapse all items from a diff
"
Class {
	#name : #IceTipCollapseAllCommand,
	#superclass : #IceTipCommand,
	#instVars : [
		'tool'
	],
	#category : #'Iceberg-TipUI-Commands'
}

{ #category : #activation }
IceTipCollapseAllCommand class >> browserContextActivation [
	<classAnnotation>
	
	^ CmdContextMenuActivation byRootGroupItemFor: IceTipDiffContext
]

{ #category : #accessing }
IceTipCollapseAllCommand class >> defaultHelp [ 

	^ 'Collapses all nodes in the changes tree'
]

{ #category : #activation }
IceTipCollapseAllCommand class >> defaultMenuItemName [

	^ 'Collapse all'
]

{ #category : #execution }
IceTipCollapseAllCommand >> execute [

	tool collapseAll
]

{ #category : #execution }
IceTipCollapseAllCommand >> readParametersFromContext: aToolContext [
	
	super readParametersFromContext: aToolContext.
	tool := aToolContext tool
]
