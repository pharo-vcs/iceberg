Class {
	#name : #IceTipTagModel,
	#superclass : #IceTipCommitishModel,
	#category : 'Iceberg-TipUI-Model'
}

{ #category : #accessing }
IceTipTagModel >> commitModels [
	
	| commits |
	commits := OrderedCollection new.
	self entity commitsDo: [ :each | 
		commits add: (IceTipCommitModel 
			repositoryModel: self repositoryModel 
			on: each) 
			beCached ].
	^ commits
]

{ #category : #actions }
IceTipTagModel >> delete [
	<noCache>
	
	IceTipStandardAction new
		repository: self repositoryModel entity;
		message: ('Removing tag {1}' format: { self name });
		onSuccessRepositoryModified;
		do: [ self repositoryModel entity removeTag: self entity ]
]

{ #category : #accessing }
IceTipTagModel >> descriptionWithDecoration [
	
	^ self entity name
]

{ #category : #accessing }
IceTipTagModel >> name [
	
	^ self entity name
]

{ #category : #actions }
IceTipTagModel >> previewCheckout [
	"this will open a 'checkout browser' that will allow user to validate the changes before 
	 actually checking out (checkout operation will be called in my sibling method, #checkout)"
	<noCache>

	(IceTipCheckoutPreviewBrowser onBranch: self) openWithSpec
]
