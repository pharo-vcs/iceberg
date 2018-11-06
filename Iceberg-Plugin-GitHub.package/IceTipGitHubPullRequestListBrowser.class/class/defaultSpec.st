specs
defaultSpec
	^ SpecLayout composed
		newColumn: [ :mainColumn | 
			mainColumn
				newRow: #toolbar height: IceTipToolbar defaultHeight;
				newRow: #pullRequests height: 150;
				addHSplitter;
				newRow: #details ]