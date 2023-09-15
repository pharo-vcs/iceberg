Class {
	#name : 'IceTipWorkingCopyBrowserOnDetachedRepoTest',
	#superclass : 'IceTipWorkingCopyBrowserTest',
	#category : 'Iceberg-UI-Tests-Browsers',
	#package : 'Iceberg-UI-Tests',
	#tag : 'Browsers'
}

{ #category : 'running' }
IceTipWorkingCopyBrowserOnDetachedRepoTest >> newFixture [
	
	^ IceDetachedWorkingCopyFixture inGit
]

{ #category : 'running' }
IceTipWorkingCopyBrowserOnDetachedRepoTest >> testStatusBarShowsStatusOfRepository [

	self assert:
		((presenter statusBar presenters
					select: [ :e | e class = SpLabelPresenter ])
					anySatisfy: [ :aLabel | aLabel label = 'Detached Working Copy' ])
]
