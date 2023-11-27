"
I'm a tool to show all repositories registered on this image. 
I define basic actions and an entry point to manage each repository individually.

IceTipRepositoriesBrowser new open.
"
Class {
	#name : 'IceTipRepositoriesBrowser',
	#superclass : 'IceTipBrowser',
	#instVars : [
		'currentGroupPanel',
		'repositoryNotebook',
		'notifyPanel'
	],
	#category : 'Iceberg-TipUI-View-Repository',
	#package : 'Iceberg-TipUI',
	#tag : 'View-Repository'
}

{ #category : 'commands' }
IceTipRepositoriesBrowser class >> buildGeneralCommandGroupWith: presenter for: aCommandGroup [

	{ 	IceTipFetchAllProjectCommand.
		IceTipAddRepositoryCommand.
		IceTipSettingsCommand
		} do: [ :each | 
			aCommandGroup register: (each forSpecContext: presenter) ]

]

{ #category : 'commands' }
IceTipRepositoriesBrowser class >> buildSelectionCommandGroupWith: presenter for: aCommandGroup [

	{
		IceTipRepairCommand.
		IceTipManagePackagesCommand.
		IceTipCommitCommand.
		IceTipPullCommand.
		IceTipPushCommand.
		IceTipFetchCommand.
		IceTipCheckoutBranchCommand.
	 	IceTipCreateTagCommand.
		IceTipMergeCommand.
		IceTipManageRepositoryCommand.
		IceTipEditRepositoryCommand.
		IceTipForgetRepositoryCommand.
		} do: [ :each |
			aCommandGroup register: (each forSpecContext: presenter) ]

]

{ #category : 'commands' }
IceTipRepositoriesBrowser class >> buildSelectionExtraCommandGroupWith: presenter for: aCommandGroup [

	super buildSelectionExtraCommandGroupWith: presenter for: aCommandGroup.

	{	IceTipCalculateDirtyPackagesCommand.
		IceTipCopyCommitishCommand.
		IceTipOpenNativelyCommand.
		} do: [ :each |
			aCommandGroup register: (each forSpecContext: presenter) ]

]

{ #category : 'accessing' }
IceTipRepositoriesBrowser class >> iconForWorldMenu [

	^ self iconNamed: #komitterSmalltalkhubRemote
]

{ #category : 'world menu' }
IceTipRepositoriesBrowser class >> menuCommandOn: aBuilder [ 
	"Add a custom menu item to the world menu"	
	<worldMenu> 
	
	(aBuilder item: #'Git Repositories Browser')
		order: 1;
		icon: self iconForWorldMenu;
		parent: #'Versioning';
		keyText: 'o, i';
		help: 'Iceberg is a set of tools that allow one to handle git repositories directly from a Pharo image.';
		action: [ self new open ]
]

{ #category : 'instance creation' }
IceTipRepositoriesBrowser class >> new [
	
	^ self newOnRepositoryProvider: IceRepository
]

{ #category : 'instance creation' }
IceTipRepositoriesBrowser class >> newOnRepositoryProvider: aProvider [ 
	| application |
	
	"I don't know if iceberg is loaded before or after or even with newtools. 
	 But in case is present, I want iceberg to run within the same context"
	application := (self environment classNamed: #StPharoApplication)
		ifNotNil: [ :c | c current ].
	"SD: why not using self application?"

	^ self basicNew
		application: application;
		model: (IceTipRepositoriesModel new 
			repositoryProvider: aProvider; 
			yourself);
		initialize;
		yourself
]

{ #category : 'initialization' }
IceTipRepositoriesBrowser >> addLibGitNotAvailableWarning [
	
	notifyPanel layout add: (notifyPanel newLabel 
		label: 'There is no libgit2 available in your system! Please verify everything is fine before continue.';
		yourself).
	notifyPanel show
]

{ #category : 'initialization' }
IceTipRepositoriesBrowser >> connectPresenters [

	repositoryNotebook whenSelectedPageChangedDo: [ :newPage |
		newPage activePresenter ifNotNil: [ :aPresenter |
			aPresenter updatePresenter ] ]
]

{ #category : 'private' }
IceTipRepositoriesBrowser >> currentGroupPanel [

	^ currentGroupPanel ifNil: [ currentGroupPanel := self layout children first ]
]

{ #category : 'accessing - ui' }
IceTipRepositoriesBrowser >> defaultKeyboardFocus [

	^ repositoryNotebook
]

{ #category : 'layout' }
IceTipRepositoriesBrowser >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		add: notifyPanel expand: false;
		add: repositoryNotebook;
		yourself
]

{ #category : 'initialization' }
IceTipRepositoriesBrowser >> hasSelectedItem [
	
	^ repositoryNotebook selectedPage 
		ifNotNil: [ :aPage | aPage activePresenter hasSelectedItem ]
		ifNil: [ ^ false ].

]

{ #category : 'initialization' }
IceTipRepositoriesBrowser >> iconForWindow [

	^ self class iconForWorldMenu
]

{ #category : 'initialization' }
IceTipRepositoriesBrowser >> initialExtentForWindow [

	^ (600 @ 500) scaledByDisplayScaleFactor
]

{ #category : 'initialization' }
IceTipRepositoriesBrowser >> initializePresenters [

	notifyPanel := self newPresenter.
	notifyPanel layout: SpBoxLayout newVertical.
	notifyPanel addStyle: 'libgit2NotAvailable'.
	notifyPanel hide.
	
	repositoryNotebook := self newNotebook
]

{ #category : 'accessing - ui' }
IceTipRepositoriesBrowser >> mainList [
	"should not arrive here"

	^ nil
]

{ #category : 'private' }
IceTipRepositoriesBrowser >> openManagePackagesWindow [

	IceTipManagePackagesCommand new
		context: self;
		execute
]

{ #category : 'private' }
IceTipRepositoriesBrowser >> projectsPanel [
	"this method is using exclusively for testing."
	
	^ repositoryNotebook pages first activePresenter
]

{ #category : 'private' }
IceTipRepositoriesBrowser >> projectsPanelIsShowingRepository: anIceLibgitRepository [

	^ self projectsPanel isShowingRepository: anIceLibgitRepository
]

{ #category : 'private' }
IceTipRepositoriesBrowser >> projectsPanelRepositoryList [
	"this method is using exclusively for testing. 
	 it will answer the repository list form the projects page"
	
	^ self projectsPanel repositoryList
]

{ #category : 'private' }
IceTipRepositoriesBrowser >> projectsPanelRepositoryModels [
	"this method is used exclusively for testing"

	^ self projectsPanelRepositoryList items
]

{ #category : 'private' }
IceTipRepositoriesBrowser >> refresh [

	repositoryNotebook selectedPage ifNil: [ ^ self ].
	repositoryNotebook selectedPage activePresenter updatePresenter
]

{ #category : 'commands' }
IceTipRepositoriesBrowser >> refreshCommands [
	| rootGroup |

	rootGroup := self visibleRootCommandsGroup.

	self
		refreshShortcutsWith: rootGroup;
		refreshToolbarWith: rootGroup
]

{ #category : 'accessing' }
IceTipRepositoriesBrowser >> repositoryModel [
	
	^ self selectedItem
]

{ #category : 'accessing' }
IceTipRepositoriesBrowser >> selectedItem [

	^ repositoryNotebook selectedPage 
		ifNotNil: [ :aPage | aPage activePresenter selectedItem ]
		ifNil: [ nil ]
]

{ #category : 'commands' }
IceTipRepositoriesBrowser >> selectionCommandsGroup [ 

	^ self visibleRootCommandsGroup
		commandOrGroupNamed: self class selectionCommandGroupName
		ifNone: [ nil ]
]

{ #category : 'initialization' }
IceTipRepositoriesBrowser >> subscribeToAnnouncements [

	Iceberg announcer weak 
		when: IceAnnouncement 
		send: #refresh
		to: self
]

{ #category : 'initialization' }
IceTipRepositoriesBrowser >> titleForWindow [

	^ 'Repositories'
]

{ #category : 'initialization' }
IceTipRepositoriesBrowser >> updatePresenter [

	LGitLibrary uniqueInstance isAvailable 
		ifFalse: [ self addLibGitNotAvailableWarning ].
	
	self model repositoryGroups do: [ :group |
		repositoryNotebook 
			addPageTitle: group label 
			provider: [ 
				(self instantiate: IceTipRepositoryGroupPanel on: group)
					transmitDo: [ "self refreshCommands" ];
				yourself ] ].
	
	self refresh
]

{ #category : 'commands' }
IceTipRepositoriesBrowser >> visibleRootCommandsGroup [
	| rootGroup |	
		
	rootGroup := self rootCommandsGroup.
	IceTipCleanCommandGroupVisitor new visit: rootGroup.
	^ rootGroup
]
