private
showEmptyTab
	emptyTab ifNil: [ emptyTab := self newEmptyTab ].
	self removeAllCommitPanelTabs.
	commitTabPanel addTab: emptyTab.