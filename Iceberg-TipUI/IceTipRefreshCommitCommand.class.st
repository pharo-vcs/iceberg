"
Command that launches a refresh of the commit tree during commit
"
Class {
	#name : 'IceTipRefreshCommitCommand',
	#superclass : 'IceTipCommand',
	#category : 'Iceberg-TipUI-Commands',
	#package : 'Iceberg-TipUI',
	#tag : 'Commands'
}

{ #category : 'accessing - defaults' }
IceTipRefreshCommitCommand class >> defaultDescription [

	^ 'Refresh this change tree'
]

{ #category : 'accessing - defaults' }
IceTipRefreshCommitCommand class >> defaultName [

	^ 'Refresh'
]

{ #category : 'executing' }
IceTipRefreshCommitCommand >> execute [

	self repositoryModel reset.
	"Announce to my owner (not the general announcement, because just my owner panel is 
	 interested on this action)"
	self toolAnnouncer announce: (IceTipDiffRefreshed for: self repository)
]

{ #category : 'accessing' }
IceTipRefreshCommitCommand >> iconName [

	^ #glamorousRefresh
]

{ #category : 'accessing' }
IceTipRefreshCommitCommand >> shouldBeDisplayedOnRightSideInToolbar [

	^ true
]
