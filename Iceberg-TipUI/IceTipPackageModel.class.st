"
I'm a model for IcePackage entries.
"
Class {
	#name : 'IceTipPackageModel',
	#superclass : 'IceTipEntityModel',
	#category : 'Iceberg-TipUI-Model',
	#package : 'Iceberg-TipUI',
	#tag : 'Model'
}

{ #category : 'actions' }
IceTipPackageModel >> browsePackage [
	<noCache>

	self entity browse
]

{ #category : 'actions' }
IceTipPackageModel >> browseRepositoryVersion [
	<noCache>
	| snapshot |
	
	snapshot := self entity mcSnapshotInRepository.
	(MCSnapshotBrowser forSnapshot: snapshot)
		showLabelled: 'Snapshot for ', self entity name
]

{ #category : 'accessing' }
IceTipPackageModel >> description [
	| text |
	
	text := self displayString.
	self entity isModified 
		ifTrue: [ text := '*', text ].
	^ text
]

{ #category : 'accessing' }
IceTipPackageModel >> descriptionDecorator [

	self entity isModified 
		ifTrue: [ ^ IceTipDescriptionDecorator modified ].
	self entity isLoaded
		ifFalse:[ ^ IceTipDescriptionDecorator notLoaded ].
	
	^ super descriptionDecorator
]

{ #category : 'testing' }
IceTipPackageModel >> isLoaded [
	^ self entity isLoaded
]

{ #category : 'testing' }
IceTipPackageModel >> isModified [
	^ self entity isModified
]

{ #category : 'accessing' }
IceTipPackageModel >> name [
	^ self entity name
]

{ #category : 'actions' }
IceTipPackageModel >> newLoadAction [
	<noCache>

	^ IceTipStandardAction new 
		repository: self entity repository;
		message: ('Loading package {1}' format: { self entity name });
		onSuccessRepositoryModified;
		action: [ 
			Iceberg announcer
				suspendAllForRepository: self entity repository
				while: [ self entity load ] ];
		yourself
]

{ #category : 'actions' }
IceTipPackageModel >> newReloadAction [
	<noCache>

	^ IceTipStandardAction new 
		repository: self entity repository;
		message: ('Reloading package {1}' format: { self entity name }) ;
		onSuccessRepositoryModified;
		action: [ 
			Iceberg announcer 
				suspendAllForRepository: self entity repository 
				while: [ self entity reload ] ];
		yourself
]

{ #category : 'actions' }
IceTipPackageModel >> newRemoveAction [
	<noCache>

	^ IceTipStandardAction new 
		repository: self entity repository;
		message: ('Removing package {1}' format: { self entity name });
		onSuccessRepositoryModified; 
		action: [ 
			Iceberg announcer
				suspendAllForRepository: self entity repository
				while: [ self entity remove ] ];
		yourself
]

{ #category : 'accessing' }
IceTipPackageModel >> packageName [
	^ self entity packageName
]

{ #category : 'accessing' }
IceTipPackageModel >> status [
	"entity could be a repository or a package"
	[
		self entity repository isMissing ifTrue: [ ^ 'Local repository missing' ].
		self entity isLoaded ifFalse: [ ^ 'Not loaded' ].
		self entity isModified ifTrue: [ ^ 'Uncommitted changes' ].
		^ 'Up to date' ] 
	on: Error do: [ :e | 
		^ e description ]
]

{ #category : 'accessing' }
IceTipPackageModel >> statusDecorator [

	self entity isLoaded 
		ifFalse: [ IceTipDescriptionDecorator notLoaded ].
	^ super statusDecorator
]

{ #category : 'actions' }
IceTipPackageModel >> unload [
	<noCache>

	IceTipStandardAction new 
		repository: self entity repository;
		message: ('Unloading package {1}' format: { self entity name });
		onSuccessRepositoryModified; 
		execute: [ 
			Iceberg announcer
				suspendAllForRepository: self entity repository
				while: [ self entity unload ] ]
]
