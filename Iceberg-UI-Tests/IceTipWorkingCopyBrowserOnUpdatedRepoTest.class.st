Class {
	#name : #IceTipWorkingCopyBrowserOnUpdatedRepoTest,
	#superclass : #IceTipWorkingCopyBrowserTest,
	#category : #'Iceberg-UI-Tests-Browsers'
}

{ #category : #running }
IceTipWorkingCopyBrowserOnUpdatedRepoTest >> newFixture [
	
	^ IceSinglePackageFixture inGit
]

{ #category : #running }
IceTipWorkingCopyBrowserOnUpdatedRepoTest >> testStatusBarShowsStatusOfRepository [

	self assert:
		((presenter statusBar rightPanel presenters
					select: [ :e | e class = SpLabelPresenter ])
					anySatisfy: [ :aLabel | aLabel label = 'Up to date' ])
]
