initialization
refresh
	actionMorphPanel removeAllMorphs.
	actions do: [ :each |
		actionMorphPanel addMorphBack: (each buildWithSpec
			hResizing: #rigid;
			width: self actionWidth;
			yourself) ]