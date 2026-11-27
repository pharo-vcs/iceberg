"
I am a command to be able to see the hierarchy of a method.
"
Class {
	#name : 'IceSBBrowseHierarchyMethodCommand',
	#superclass : 'IceSBBrowserAbstractMethodCommand',
	#category : 'Iceberg-TipUI-SnapshotBrowser',
	#package : 'Iceberg-TipUI-SnapshotBrowser'
}

{ #category : 'default' }
IceSBBrowseHierarchyMethodCommand class >> defaultName [

	^ 'Browse (in image) hierarchy...'
]

{ #category : 'testing' }
IceSBBrowseHierarchyMethodCommand >> canBeExecuted [ 

	^ super canBeExecuted and: [ self selectedClassIsLoaded ]
]

{ #category : 'executing' }
IceSBBrowseHierarchyMethodCommand >> execute [
	"Browse the selected method"

	self systemNavigation 
		browseHierarchy: context selectedClassOrMetaClass
		selector: context selectedMessageName	
]
