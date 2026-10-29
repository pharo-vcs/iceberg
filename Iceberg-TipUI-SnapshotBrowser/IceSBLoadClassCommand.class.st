"
I am a command to load a class in the snapshot browser.
"
Class {
	#name : 'IceSBLoadClassCommand',
	#superclass : 'IceSBBrowserAbstractClassCommand',
	#category : 'Iceberg-TipUI-SnapshotBrowser',
	#package : 'Iceberg-TipUI-SnapshotBrowser'
}

{ #category : 'default' }
IceSBLoadClassCommand class >> defaultName [

	^ 'Load class...'
]

{ #category : 'executing' }
IceSBLoadClassCommand >> execute [
	"Load the selected class"

	| loader |
	self packageClasses
		detect: [ :ea | ea className = self selectedClass ]
		ifFound: [ :aClass | 

			loader := MCPackageLoader new.
			loader addDefinition: aClass.

			self methodsForSelectedClass 
				do: [ :m | loader addDefinition: m ].
			
			loader load ]
]

{ #category : 'executing' }
IceSBLoadClassCommand >> methodsForSelectedClass [

	^ context methodsForSelectedClass
]

{ #category : 'executing' }
IceSBLoadClassCommand >> packageClasses [

	^ context packageClasses
]
