Class {
	#name : 'IceTipWorkingCopyBrowserOnUpdatedRepoTest',
	#superclass : 'IceTipWorkingCopyBrowserTest',
	#category : 'Iceberg-UI-Tests-Browsers',
	#package : 'Iceberg-UI-Tests',
	#tag : 'Browsers'
}

{ #category : 'running' }
IceTipWorkingCopyBrowserOnUpdatedRepoTest >> newFixture [
	
	^ IceSinglePackageFixture inGit
]

{ #category : 'running' }
IceTipWorkingCopyBrowserOnUpdatedRepoTest >> testStatusBarShowsStatusOfRepository [

	self assert:
		((presenter statusBar presenters
					select: [ :e | e class = SpLabelPresenter ])
					anySatisfy: [ :aLabel | aLabel label = 'Up to date' ])
]
