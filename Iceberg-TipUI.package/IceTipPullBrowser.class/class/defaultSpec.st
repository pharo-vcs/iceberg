specs
defaultSpec
	<spec: #default>
	
	^ SpecLayout composed
		newColumn: [ :mainColumn |
			mainColumn
				newRow: #toolbar height: IceTipToolbar defaultHeight;
				newRow: #remotePanel height: self inputTextHeight;
				newRow: [ :row |
					row newColumn: [ :column |
						column 
							add: #commitsPanel withSpec: #panelSpec;
							add: #actionPanel height: self iceActionPanelHeight ] ] ]