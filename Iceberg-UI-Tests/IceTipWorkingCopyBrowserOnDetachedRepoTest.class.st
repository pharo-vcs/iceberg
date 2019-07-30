Class {
	#name : #IceTipWorkingCopyBrowserOnDetachedRepoTest,
	#superclass : #IceTipWorkingCopyBrowserTest,
	#category : #'Iceberg-UI-Tests-Browsers'
}

{ #category : #running }
IceTipWorkingCopyBrowserOnDetachedRepoTest >> newFixture [
	
	^ IceDetachedWorkingCopyFixture inGit
]

{ #category : #running }
IceTipWorkingCopyBrowserOnDetachedRepoTest >> testStatusBarShowsCommit [
	self skip.
	self
		assert:
			((presenter statusBar leftPanel presenters
				select: [ :e | e class = SpLabelPresenter ])
				anySatisfy: [ :aLabel | aLabel label = 'Lala' ])
]

{ #category : #running }
IceTipWorkingCopyBrowserOnDetachedRepoTest >> testStatusBarShowsStatusOfRepository [

	self assert:
		((presenter statusBar rightPanel presenters
					select: [ :e | e class = SpLabelPresenter ])
					anySatisfy: [ :aLabel | aLabel label = 'Detached Working Copy' ])
]
