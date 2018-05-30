private
removeAllCommitPanelTabs
	commitTabPanel tabs copy 
		do: [ :each | commitTabPanel removeTab: each ]