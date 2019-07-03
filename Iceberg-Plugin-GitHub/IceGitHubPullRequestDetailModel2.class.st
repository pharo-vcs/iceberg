"
I'm a spec2 model to present a detailed view of a Pull Request.
"
Class {
	#name : #IceGitHubPullRequestDetailModel2,
	#superclass : #SpPresenter,
	#instVars : [
		'urlLabel',
		'urlText',
		'authorLabel',
		'authorText',
		'fromLabel',
		'fromText',
		'toLabel',
		'toText',
		'mergeableLabel',
		'mergeablePanel',
		'statusLabel',
		'statusPanel',
		'checksTable',
		'bodyText',
		'pullRequest'
	],
	#category : #'Iceberg-Plugin-GitHub-View'
}

{ #category : #specs }
IceGitHubPullRequestDetailModel2 class >> defaultSpec [
	<spec>
	^ SpBoxLayout newVertical
		add:
			(SpBoxLayout newHorizontal
				add: #urlLabel
					withConstraints:
						[ :constraints | constraints width: 80 * self currentWorld displayScaleFactor ];
				add: #urlText;
				yourself);
		add:
			(SpBoxLayout newHorizontal
				add: #authorLabel
					withConstraints:
						[ :constraints | constraints width: 80 * self currentWorld displayScaleFactor ];
				add: #authorText;
				yourself);
		add:
			(SpBoxLayout newHorizontal
				add: #fromLabel
					withConstraints:
						[ :constraints | constraints width: 80 * self currentWorld displayScaleFactor ];
				add: #fromText;
				yourself);
		add:
			(SpBoxLayout newHorizontal
				add: #toLabel
					withConstraints:
						[ :constraints | constraints width: 80 * self currentWorld displayScaleFactor ];
				add: #toText;
				yourself);
		add:
			(SpBoxLayout newHorizontal
				add: #mergeableLabel
					withConstraints:
						[ :constraints | constraints width: 80 * self currentWorld displayScaleFactor ];
				add: #mergeablePanel;
				yourself)
			withConstraints:
				[ :constraints | constraints height: 25 * self currentWorld displayScaleFactor ];
		add:
			(SpBoxLayout newHorizontal
				add: #statusLabel
					withConstraints:
						[ :constraints | constraints width: 80 * self currentWorld displayScaleFactor ];
				add: #statusPanel;
				yourself)
			withConstraints:
				[ :constraints | constraints height: 25 * self currentWorld displayScaleFactor ];
		add: #checksTable;
		add: #bodyText;
		yourself
]

{ #category : #'accessing ui' }
IceGitHubPullRequestDetailModel2 >> authorLabel [
	^ authorLabel
]

{ #category : #'accessing ui' }
IceGitHubPullRequestDetailModel2 >> authorLabel: anObject [
	authorLabel := anObject
]

{ #category : #'accessing ui' }
IceGitHubPullRequestDetailModel2 >> authorText [
	^ authorText
]

{ #category : #'accessing ui' }
IceGitHubPullRequestDetailModel2 >> authorText: anObject [
	authorText := anObject
]

{ #category : #'accessing ui' }
IceGitHubPullRequestDetailModel2 >> bodyText [
	^ bodyText
]

{ #category : #'accessing ui' }
IceGitHubPullRequestDetailModel2 >> bodyText: anObject [
	bodyText := anObject
]

{ #category : #'accessing ui' }
IceGitHubPullRequestDetailModel2 >> checksTable [
	^ checksTable
]

{ #category : #'accessing ui' }
IceGitHubPullRequestDetailModel2 >> checksTable: anObject [
	checksTable := anObject
]

{ #category : #'accessing ui' }
IceGitHubPullRequestDetailModel2 >> fromLabel [
	^ fromLabel
]

{ #category : #'accessing ui' }
IceGitHubPullRequestDetailModel2 >> fromLabel: anObject [
	fromLabel := anObject
]

{ #category : #'accessing ui' }
IceGitHubPullRequestDetailModel2 >> fromText [
	^ fromText
]

{ #category : #'accessing ui' }
IceGitHubPullRequestDetailModel2 >> fromText: anObject [
	fromText := anObject
]

{ #category : #private }
IceGitHubPullRequestDetailModel2 >> iconForMergeable: mergeable [
	mergeable = true ifTrue: [ ^ self iconNamed: #smallOk ].
	^ self iconNamed: #smallCancel
]

{ #category : #private }
IceGitHubPullRequestDetailModel2 >> iconForStatus: status [
	status = 'success' ifTrue: [ ^ self iconNamed: #testGreen ].
	status = 'failure' ifTrue: [ ^ self iconNamed: #testRed ].
	status = 'pending' ifTrue: [ ^ self iconNamed: #testYellow ].
	
	^ self iconNamed: #testNotRun
]

{ #category : #initialization }
IceGitHubPullRequestDetailModel2 >> initializeWidgets [
	urlLabel := self newLabel label: 'Url'.
	authorLabel := self newLabel label: 'Author'.
	fromLabel := self newLabel label: 'From'.
	toLabel := self newLabel label: 'Into'.
	mergeableLabel := self newLabel label: 'Mergeable'.
	statusLabel := self newLabel label: 'Status'.

	urlText := self newTextInput enabled: false.
	authorText  := self newTextInput enabled: false.
	fromText  := self newTextInput enabled: false.
	toText  := self newTextInput enabled: false.
	mergeablePanel := self newMergeablePanel.
	statusPanel := self newStatusPanel.
	checksTable := self newChecksTable.
	bodyText := self newText enabled: false.
]

{ #category : #'accessing ui' }
IceGitHubPullRequestDetailModel2 >> mergeableLabel [
	^ mergeableLabel
]

{ #category : #'accessing ui' }
IceGitHubPullRequestDetailModel2 >> mergeableLabel: anObject [
	mergeableLabel := anObject
]

{ #category : #accessing }
IceGitHubPullRequestDetailModel2 >> mergeablePanel [
	^ mergeablePanel
]

{ #category : #accessing }
IceGitHubPullRequestDetailModel2 >> mergeablePanel: anObject [
	mergeablePanel := anObject
]

{ #category : #'private factory' }
IceGitHubPullRequestDetailModel2 >> newChecksTable [
	^ FTTableMorph new 
		addColumn: ((FTColumn id: #target_url) width: 18 * World displayScaleFactor);
		addColumn: ((FTColumn id: #state) width: 65 * World displayScaleFactor);
		addColumn: ((FTColumn id: #context) width: 100 * World displayScaleFactor);
		addColumn: (FTColumn id: #description);
		cellInset: 5 * World displayScaleFactor;
		beResizable;
		vResizing: #spaceFill;
		hResizing: #spaceFill;
		asSpecAdapter
		
]

{ #category : #'private factory' }
IceGitHubPullRequestDetailModel2 >> newMergeablePanel [
	^ PanelMorph new 
		color: Color transparent;
		layoutPolicy: TableLayout new;
		listDirection: #leftToRight;
		cellInset: 5;
		vResizing: #spaceFill;
		hResizing: #spaceFill;
		asSpecAdapter
]

{ #category : #'private factory' }
IceGitHubPullRequestDetailModel2 >> newStatusPanel [
	^ PanelMorph new 
		color: Color transparent;
		layoutPolicy: TableLayout new;
		listDirection: #leftToRight;
		cellInset: 5;
		vResizing: #spaceFill;
		hResizing: #spaceFill;
		asSpecAdapter
]

{ #category : #accessing }
IceGitHubPullRequestDetailModel2 >> pullRequest [
	^ pullRequest
]

{ #category : #initialization }
IceGitHubPullRequestDetailModel2 >> pullRequest: aPullRequest [
	pullRequest := aPullRequest.
	urlText text: self pullRequest url.
	authorText text: self pullRequest author.
	fromText text: self pullRequest headLabel.
	toText text: self pullRequest baseLabel.
	bodyText text: self pullRequest body.
	self retrieveStatuses.
	self retrieveDetail
]

{ #category : #private }
IceGitHubPullRequestDetailModel2 >> retrieveDetail [
	
	self mergeablePanel widget addMorphBack: 'Loading...' asMorph.
	[ | detail mergeable |  
		[  
			detail := self pullRequest detail.
			mergeable := detail at: #mergeable ]
		on: Error do: [ :e | mergeable := nil ].
		UIManager default defer: [ 
			self mergeablePanel widget
				removeAllMorphs;
				addMorphBack: (self iconForMergeable: mergeable) asMorph;
				addMorphBack: (self textForMergeable: mergeable) asMorph ]
	] fork
]

{ #category : #private }
IceGitHubPullRequestDetailModel2 >> retrieveStatuses [
	self statusPanel widget addMorphBack: 'Loading...' asMorph.
	[ 
	| status generalStatus statuses |
	
	[
		status := self pullRequest status.
		generalStatus := status at: 'state'.
		statuses := status at: 'statuses' ]
	on: Error do: [ :e | 
		generalStatus := 'Unknown'.
		statuses := #() ].
	
	UIManager default defer: [ 
		self statusPanel widget
			removeAllMorphs;
			addMorphBack: (self iconForStatus: generalStatus) asMorph;
			addMorphBack: generalStatus asMorph.
	 	self checksTable widget dataSource: (IceGitHubPullRequestDataSource elements: statuses) ]
	] fork
]

{ #category : #'accessing ui' }
IceGitHubPullRequestDetailModel2 >> statusLabel [
	^ statusLabel
]

{ #category : #'accessing ui' }
IceGitHubPullRequestDetailModel2 >> statusLabel: anObject [
	statusLabel := anObject
]

{ #category : #'accessing ui' }
IceGitHubPullRequestDetailModel2 >> statusPanel [
	^ statusPanel
]

{ #category : #'accessing ui' }
IceGitHubPullRequestDetailModel2 >> statusPanel: anObject [
	statusPanel := anObject
]

{ #category : #private }
IceGitHubPullRequestDetailModel2 >> textForMergeable: mergeable [
	mergeable = true ifTrue: [ ^ 'Yes' ].
	mergeable = false ifTrue: [ ^ 'There are conflicts' ].
	^ mergeable asString
	
]

{ #category : #'accessing ui' }
IceGitHubPullRequestDetailModel2 >> toLabel [
	^ toLabel
]

{ #category : #'accessing ui' }
IceGitHubPullRequestDetailModel2 >> toLabel: anObject [
	toLabel := anObject
]

{ #category : #'accessing ui' }
IceGitHubPullRequestDetailModel2 >> toText [
	^ toText
]

{ #category : #'accessing ui' }
IceGitHubPullRequestDetailModel2 >> toText: anObject [
	toText := anObject
]

{ #category : #'accessing ui' }
IceGitHubPullRequestDetailModel2 >> urlLabel [
	^ urlLabel
]

{ #category : #'accessing ui' }
IceGitHubPullRequestDetailModel2 >> urlLabel: anObject [
	urlLabel := anObject
]

{ #category : #'accessing ui' }
IceGitHubPullRequestDetailModel2 >> urlText [
	^ urlText
]

{ #category : #'accessing ui' }
IceGitHubPullRequestDetailModel2 >> urlText: anObject [
	urlText := anObject
]
