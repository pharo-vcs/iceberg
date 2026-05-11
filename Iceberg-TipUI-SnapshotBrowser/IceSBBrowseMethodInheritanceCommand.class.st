"
I am a method to be able to see a method inheritance hierarchy
"
Class {
	#name : 'IceSBBrowseMethodInheritanceCommand',
	#superclass : 'IceSBBrowserAbstractMethodCommand',
	#category : 'Iceberg-TipUI-SnapshotBrowser',
	#package : 'Iceberg-TipUI-SnapshotBrowser'
}

{ #category : 'default' }
IceSBBrowseMethodInheritanceCommand class >> defaultName [

	^ 'Browse (in image) inheritance'
]

{ #category : 'testing' }
IceSBBrowseMethodInheritanceCommand >> canBeExecuted [ 

	^ super canBeExecuted and: [ self selectedClassIsLoaded ]
]

{ #category : 'executing' }
IceSBBrowseMethodInheritanceCommand >> execute [
	"Browse implementors of the selected method"

	self systemNavigation 
		methodHierarchyBrowserForClass: context selectedClassOrMetaClass 
		selector: context selectedMessageName

]
