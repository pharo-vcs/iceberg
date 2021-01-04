"
I add a Hiedra column to the browser defined by my superclass. This column visualizes the relationship between commits in the history list.
"
Class {
	#name : #IceTipHiedraHistoryBrowser,
	#superclass : #IceTipHistoryBrowser,
	#instVars : [
		'hiedraColumnController'
	],
	#category : #'Iceberg-TipUI-View'
}

{ #category : #initialization }
IceTipHiedraHistoryBrowser >> initializeCommitList [
	"Add the Hiedra column at the beginning. The Datasource has the logic to render it."

	commitList
		addColumn:
			(SpImageTableColumn new
				evaluated: [ :each |
					hiedraColumnController cellMorphAtRow: (commitList items indexOf: each) ];
				title: ' ';
				width: 80;
				yourself).
	super initializeCommitList.

]

{ #category : #initialization }
IceTipHiedraHistoryBrowser >> initializeHiedraColumn [

	| ancestorIds |
	hiedraColumnController := HiColumnController new.
	hiedraColumnController renderer
		arrowSize: 0;
		nodeConnectionOffset: 0;
		nodeRadius: 1.75.

	ancestorIds := Dictionary new.
	self model commitModels do: [ :aCommit |
		"Note: Hiedra expects each ancestor id corresponds to a commit in elements."
		ancestorIds
			at: aCommit id
			put: aCommit entity ancestorIds ].

	hiedraColumnController ruler: (HiRulerBuilder
		newRulerValues: (self model commitModels collect: #id) "Note: ids should keep the original order."
		linksBlock: [ :id | ancestorIds at: id ]).

	hiedraColumnController renderer rowHeight: 20; cellWidth: 5.25
]

{ #category : #initialization }
IceTipHiedraHistoryBrowser >> initializePresenters [

	super initializePresenters.
	self initializeHiedraColumn
]

{ #category : #accessing }
IceTipHiedraHistoryBrowser >> refresh [

	self refreshHiedraColumn.
	super refresh
]

{ #category : #accessing }
IceTipHiedraHistoryBrowser >> refreshHiedraColumn [
	| ancestorIds |

	ancestorIds := Dictionary new.
	self model commitModels do: [ :aCommit |
		ancestorIds
			at: aCommit id
			put: aCommit entity ancestorIds ].
	hiedraColumnController reset.

	"Note: ids should keep the original order to generate the ruler correctly."
	hiedraColumnController ruler: (HiRulerBuilder
		newRulerValues: (self model commitModels collect: #id) 
		linksBlock: [ :id | ancestorIds at: id ]).

]
