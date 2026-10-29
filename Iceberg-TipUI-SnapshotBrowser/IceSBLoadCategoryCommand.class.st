Class {
	#name : 'IceSBLoadCategoryCommand',
	#superclass : 'IceSnapshotBrowserCommand',
	#category : 'Iceberg-TipUI-SnapshotBrowser',
	#package : 'Iceberg-TipUI-SnapshotBrowser'
}

{ #category : 'default' }
IceSBLoadCategoryCommand class >> defaultName [

	^ 'Load category...'
]

{ #category : 'testing' }
IceSBLoadCategoryCommand >> canBeExecuted [ 

	^ self categorySelection notNil
]

{ #category : 'executing' }
IceSBLoadCategoryCommand >> categorySelection [

	^ context categorySelection
]

{ #category : 'executing' }
IceSBLoadCategoryCommand >> execute [
	"Load the entire selected category"

	| loader |

	loader := MCPackageLoader new.

	self methodsForSelectedClassCategory 
		do: [ :m | loader addDefinition: m ].
		
	loader load
]

{ #category : 'executing' }
IceSBLoadCategoryCommand >> methodsForSelectedClassCategory [

	^ context methodsForSelectedClassCategory 
]
