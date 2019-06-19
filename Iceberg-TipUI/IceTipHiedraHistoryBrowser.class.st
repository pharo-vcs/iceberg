"
I add a Hiedra column to the browser defined by my superclass. This column visualizes the relationship between commits in the history list.
"
Class {
	#name : #IceTipHiedraHistoryBrowser,
	#superclass : #IceTipHistoryBrowser,
	#category : #'Iceberg-TipUI-View'
}

{ #category : #initialization }
IceTipHiedraHistoryBrowser >> initializeCommitList [

	"Add the Hiedra column at the beginning. The Datasource has the logic to render it."
	commitList widget addColumn:
		(IceTipTableColumn new
			id: ' ';
			yourself).

	super initializeCommitList.
]

{ #category : #'private factory' }
IceTipHiedraHistoryBrowser >> newCommitsDataSource [
	^ IceTipHiedraDataSource new 
		tool: self;
		elements: #(); "It will be set when refreshing"
		yourself
]
