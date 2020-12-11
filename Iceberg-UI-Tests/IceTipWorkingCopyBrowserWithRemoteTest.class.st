Class {
	#name : #IceTipWorkingCopyBrowserWithRemoteTest,
	#superclass : #IceTipWorkingCopyBrowserTest,
	#instVars : [
		'remoteWorkingCopy'
	],
	#category : #'Iceberg-UI-Tests-Browsers'
}

{ #category : #running }
IceTipWorkingCopyBrowserWithRemoteTest >> newFixture [

	^ IceClonedFromRemoteFixture inGit
]

{ #category : #'tests-fetch' }
IceTipWorkingCopyBrowserWithRemoteTest >> setUp [

	super setUp.
	"The current fixture has three repositories.
	remoteRepository has remote pushRepository.
	repository has remote pushRepository.
	pushRepository is a bare repository so we cannot commit to it.
	Commit in RemoteRepository, then push
	  => this will make that commit available for fetching and pulling from repository"
	
	remoteWorkingCopy := self remoteRepository workingCopy.
	remoteWorkingCopy addPackageNamed: self packageName2.
	remoteWorkingCopy commitWithMessage: 'Adding Empty Package'.
	self remoteRepository push
]

{ #category : #'tests-fetch' }
IceTipWorkingCopyBrowserWithRemoteTest >> testAddPackageInModelThenAnnounceAddsPackageToList [

	"Add package directly in the model without notifying the UI"
	remoteWorkingCopy := self repository workingCopy.
	remoteWorkingCopy addPackageNamed: self packageName2.
	
	"Then notify the UI with an announcement"
	Iceberg announcer announce: (IceRepositoryModified for: self repository).
	
	self assert: (presenter showsPackageNamed: self packageName2).
]

{ #category : #'tests-fetch' }
IceTipWorkingCopyBrowserWithRemoteTest >> testCommitThenAnnounceCommitedUpdatesPushBadge [

	| pushButton |
	
	"Commit directly in the model without notifying the UI"
	remoteWorkingCopy := self repository workingCopy.
	remoteWorkingCopy addPackageNamed: self packageName2.
	remoteWorkingCopy commitWithMessage: 'New commit'.
	
	"Then notify the UI with an announcement"
	Iceberg announcer announce: (IceCommited for: self repository).
	
	pushButton := presenter toolbar itemNamed: 'Push'.
	self assert: pushButton badge equals: 1
]

{ #category : #'tests-fetch' }
IceTipWorkingCopyBrowserWithRemoteTest >> testCommitThenAnnounceUpdatesPushBadge [

	| pushButton |
	
	"Commit directly in the model without notifying the UI"
	remoteWorkingCopy := self repository workingCopy.
	remoteWorkingCopy addPackageNamed: self packageName2.
	remoteWorkingCopy commitWithMessage: 'New commit'.
	
	"Then notify the UI with an announcement"
	Iceberg announcer announce: (IceRepositoryModified for: self repository).
	
	pushButton := presenter toolbar itemNamed: 'Push'.
	self assert: pushButton badge equals: 1
]

{ #category : #'tests-fetch' }
IceTipWorkingCopyBrowserWithRemoteTest >> testFetchButtonUpdatesPullBadge [

	"If fetch brings commits in the upstream of the current branch, the badge of the pull button should be updated"	
	| fetchButton pullButton |

	fetchButton := presenter toolbar itemNamed: 'Fetch'.
	fetchButton click.

	pullButton := presenter toolbar itemNamed: 'Pull'.
	self assert: pullButton badge equals: 1
]

{ #category : #'tests-fetch' }
IceTipWorkingCopyBrowserWithRemoteTest >> testMakePackageDirtyInModelThenAnnounceMakesPackageDirtyInList [

	"Add package directly in the model without notifying the UI"
	remoteWorkingCopy := self repository workingCopy.
	(remoteWorkingCopy packageNamed: self packageName1) beDirty.
	
	"Then notify the UI with an announcement"
	Iceberg announcer announce: (IceRepositoryModified for: self repository).

	self assert: (presenter packagesTable valueAtColumn: 1 row: 1) equals: ('*', self packageName1) asText.
]

{ #category : #'tests-fetch' }
IceTipWorkingCopyBrowserWithRemoteTest >> testMakePackageNonDirtyInModelThenAnnounceMakesPackageDirtyInList [

	"Add package directly in the model without notifying the UI"
	remoteWorkingCopy := self repository workingCopy.
	(remoteWorkingCopy packageNamed: self packageName1) beDirty.

	"Then notify the UI with an announcement"
	Iceberg announcer announce: (IceRepositoryModified for: self repository).	

	"Mark package directly as non-dirty again in the model without notifying the UI"
	remoteWorkingCopy := self repository workingCopy.
	(remoteWorkingCopy packageNamed: self packageName1) beClean.

	"Then notify the UI with an announcement"
	Iceberg announcer announce: (IceRepositoryModified for: self repository).

	self assert: (presenter packagesTable valueAtColumn: 1 row: 1) equals: self packageName1 asText.
]

{ #category : #'tests-fetch' }
IceTipWorkingCopyBrowserWithRemoteTest >> testNonDirtyPackageIsNotDirtyInList [

	self assert: (presenter packagesTable valueAtColumn: 1 row: 1) equals: self packageName1 asText.
]

{ #category : #'tests-fetch' }
IceTipWorkingCopyBrowserWithRemoteTest >> testPullButtonHasNoBadgeBeforeFetching [

	"If we don't fetch, the badge of the pull button should not be updated"	
	| pullButton |
	pullButton := presenter toolbar itemNamed: 'Pull'.
	self deny: pullButton hasBadge
]

{ #category : #'tests-fetch' }
IceTipWorkingCopyBrowserWithRemoteTest >> testPushButtonHasNoBadgeBeforeCommit [

	| pushButton |
	pushButton := presenter toolbar itemNamed: 'Push'.

	self deny: pushButton hasBadge
]
