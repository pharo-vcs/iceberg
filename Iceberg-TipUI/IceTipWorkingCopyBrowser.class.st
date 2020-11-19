"
I'm a tool to show the internals of a repository from the point of view of an image. 
I show the packages managed by this repository and a series of actions to properly handle them in the context of an iceberg repository.

(IceTipPackagesBrowser forRepository: IceRepository registry anyOne) openWithSpec
"
Class {
	#name : #IceTipWorkingCopyBrowser,
	#superclass : #IceTipBrowser2,
	#instVars : [
		'packageList',
		'statusBar'
	],
	#category : #'Iceberg-TipUI-View'
}

{ #category : #specs }
IceTipWorkingCopyBrowser class >> defaultSpec [
	<spec: #default>
	
	^ SpBoxLayout newVertical 
			add: #packageList;
			yourself 
]

{ #category : #'instance creation' }
IceTipWorkingCopyBrowser class >> onRepository: aRepository [
	^ self on: (IceTipRepositoryModel on: aRepository)
]

{ #category : #accessing }
IceTipWorkingCopyBrowser >> contextClass [

	^ IceTipWorkingCopyContext
]

{ #category : #'private factory' }
IceTipWorkingCopyBrowser >> createCommandContext [

	^ self newContextWithSelection: self packageSelected
]

{ #category : #accessing }
IceTipWorkingCopyBrowser >> initialExtentForWindow [

	^ (700 @ 500) scaledByDisplayScaleFactor
]

{ #category : #initialization }
IceTipWorkingCopyBrowser >> initializePackageList [

	packageList
		beResizable;
		addColumn:
			((SpStringTableColumn evaluated: #descriptionWithDecoration)
				title: 'Name';
				yourself);
		addColumn:
			((SpStringTableColumn evaluated: #statusWithDecoration)
				title: 'Status';
				yourself);
		items: self model packageModels;
		selectIndex: 1;
		itemFilter: [ :anItem :aPattern | 
			IceTipPackageFilter new
				pattern: aPattern;
				matches: anItem ];
		contextMenu: [ self buildMenu ]

]

{ #category : #initialization }
IceTipWorkingCopyBrowser >> initializePresenters [

	super initializePresenters.
	packageList := self newTable.
	statusBar := self newStatusBar.

	self initializePackageList.
	self rebuildStatusBar.

	self focusOrder add: packageList
]

{ #category : #initialization }
IceTipWorkingCopyBrowser >> initializeWindow: aSpWindowPresenter [
	
	super initializeWindow: aSpWindowPresenter.

	aSpWindowPresenter
		title: self titleForWindow;
		statusBar: statusBar

]

{ #category : #'private factory' }
IceTipWorkingCopyBrowser >> newContextWithSelection: anObject [

	^ self newContext
		  packageModel: anObject;
		  yourself
]

{ #category : #'accessing ui' }
IceTipWorkingCopyBrowser >> packageList [

	^ packageList
]

{ #category : #private }
IceTipWorkingCopyBrowser >> packageSelected [

	^ packageList selection selectedItem
]

{ #category : #accessing }
IceTipWorkingCopyBrowser >> rebuildStatusBar [

	statusBar pushMessage: self model status
]

{ #category : #accessing }
IceTipWorkingCopyBrowser >> refresh [

	self rebuildToolbar.
	self rebuildStatusBar.
	packageList items: self model packageModels.
	
]

{ #category : #private }
IceTipWorkingCopyBrowser >> refreshWhenRepository: ann [

	(ann repository isNil or: [ 
		self model repositoryModel isModelOf: ann repository ]) ifFalse: [ 
		^ self ].
	self model reset.
	self refresh

]

{ #category : #initialization }
IceTipWorkingCopyBrowser >> setModelBeforeInitialization: aRepositoryModel [

	self model: (IceTipWorkingCopyModel on: aRepositoryModel)
]

{ #category : #testing }
IceTipWorkingCopyBrowser >> showsPackageNamed: aString [ 
	
	^ packageList items anySatisfy: [ :packageModel | packageModel name = aString ]
]

{ #category : #initialization }
IceTipWorkingCopyBrowser >> subscribeToAnnouncements [

	Iceberg announcer weak
		when: IceRepositoryAnnouncement
		send: #refreshWhenRepository:
		to: self
]

{ #category : #accessing }
IceTipWorkingCopyBrowser >> titleForWindow [

	^ 'Working copy of ', self model repositoryName
]
