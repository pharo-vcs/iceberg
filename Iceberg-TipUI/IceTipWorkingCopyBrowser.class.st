"
I'm a tool to show the internals of a repository from the point of view of an image. 
I show the packages managed by this repository and a series of actions to properly handle them in the context of an iceberg repository.

(IceTipPackagesBrowser forRepository: IceRepository registry anyOne) openWithSpec
"
Class {
	#name : #IceTipWorkingCopyBrowser,
	#superclass : #IceTipBrowser,
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
		add: #toolbar expand: false fill: true padding: 0;
			add: #packageList;
			add: #statusBar height: self defaultStatusBarHeight;
			yourself 
]

{ #category : #specs }
IceTipWorkingCopyBrowser class >> defaultStatusBarHeight [
	^ 25 * self currentWorld displayScaleFactor
]

{ #category : #'instance creation' }
IceTipWorkingCopyBrowser class >> new [
	self error: 'Use #for:'
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
IceTipWorkingCopyBrowser >> initialExtent [
	^ (700@500) scaledByDisplayScaleFactor
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
IceTipWorkingCopyBrowser >> initializeStatusBar [
	statusBar 
"		addItem: (IceTipBranchWithCommitStatusBarItem new
			model: self model;
			yourself);
"		addItem: (IceTipStatusBarTargetItem new 
			bePositionRight;
			target: self model;
			contentsBlock: #status;
			helpBlock: #status;
			yourself)
]

{ #category : #initialization }
IceTipWorkingCopyBrowser >> initializeWidgets [
	super initializeWidgets.
	packageList := self newTable.
	statusBar := self instantiate: IceTipStatusBar.

	self initializePackageList.
	self initializeStatusBar.
	
	self focusOrder add: packageList
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

{ #category : #'accessing ui' }
IceTipWorkingCopyBrowser >> packageList: anObject [
	packageList := anObject
]

{ #category : #private }
IceTipWorkingCopyBrowser >> packageSelected [
	^ packageList selection selectedItem
]

{ #category : #accessing }
IceTipWorkingCopyBrowser >> refresh [
	self rebuildToolbar. 
	packageList items: self model packageModels.
	statusBar refresh
]

{ #category : #private }
IceTipWorkingCopyBrowser >> refreshWhenRepository: ann [
	(ann repository isNil 
		or: [ self model repositoryModel isModelOf: ann repository ])
		ifFalse: [ ^ self ].
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

{ #category : #'accessing ui' }
IceTipWorkingCopyBrowser >> statusBar [
	^ statusBar
]

{ #category : #'accessing ui' }
IceTipWorkingCopyBrowser >> statusBar: anObject [
	statusBar := anObject
]

{ #category : #initialization }
IceTipWorkingCopyBrowser >> subscribeToAnnouncements [
	Iceberg announcer weak 
		when: IceRepositoryAnnouncement 
		send: #refreshWhenRepository: 
		to: self

]

{ #category : #accessing }
IceTipWorkingCopyBrowser >> title [
	^ 'Working copy of ', self model repositoryName
]
