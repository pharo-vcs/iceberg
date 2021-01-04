"
Command that launches a refresh of the commit tree during commit
"
Class {
	#name : #IceTipRefreshCommitCommand,
	#superclass : #IceTipCommand,
	#category : #'Iceberg-TipUI-Commands'
}

{ #category : #accessing }
IceTipRefreshCommitCommand class >> defaultDescription [

	^ 'Refresh this change tree'
]

{ #category : #accessing }
IceTipRefreshCommitCommand class >> defaultName [

	^ 'Refresh'
]

{ #category : #execution }
IceTipRefreshCommitCommand >> execute [

	self repositoryModel reset.
	"Announce to my owner (not the general announcement, because just my owner panel is 
	 interested on this action)"
	self toolAnnouncer announce: (IceTipDiffRefreshed for: self repository)
]

{ #category : #accessing }
IceTipRefreshCommitCommand >> iconName [

	^ #glamorousRefresh
]

{ #category : #accessing }
IceTipRefreshCommitCommand >> shouldBeDisplayedOnRightSideInToolbar [

	^ true
]
