Class {
	#name : #IceTipCleanCommandGroupVisitor,
	#superclass : #CmVisitor,
	#category : #'Iceberg-TipUI-Commands'
}

{ #category : #visiting }
IceTipCleanCommandGroupVisitor >> visitCommand: aCmCommand [
	
	aCmCommand beHiddenWhenCantBeRun
]

{ #category : #visiting }
IceTipCleanCommandGroupVisitor >> visitCommandGroup: aCmCommandsGroup [

	super visitCommandGroup: aCmCommandsGroup.

	aCmCommandsGroup groups do: [ :nestedGroup |
		(nestedGroup allCommands
			noneSatisfy: [ :each | each canBeExecuted ]) 
				ifTrue: [ aCmCommandsGroup unregister: nestedGroup ] ] 

]
