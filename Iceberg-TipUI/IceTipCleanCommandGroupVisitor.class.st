"
I'm a CmVisitor that in one hand, tells each command to be hidden if it can't be executed, and in the other hand, unregisters each group that is empty.

"
Class {
	#name : 'IceTipCleanCommandGroupVisitor',
	#superclass : 'CmVisitor',
	#category : 'Iceberg-TipUI-Commands',
	#package : 'Iceberg-TipUI',
	#tag : 'Commands'
}

{ #category : 'visiting' }
IceTipCleanCommandGroupVisitor >> visitCommand: aCmCommand [
	
	aCmCommand beHiddenWhenCantBeRun
]

{ #category : 'visiting' }
IceTipCleanCommandGroupVisitor >> visitCommandGroup: aCmCommandsGroup [

	super visitCommandGroup: aCmCommandsGroup.

	aCmCommandsGroup groups do: [ :nestedGroup |
		(nestedGroup allCommands
			noneSatisfy: [ :each | each canBeExecuted ]) 
				ifTrue: [ aCmCommandsGroup unregister: nestedGroup ] ] 

]
