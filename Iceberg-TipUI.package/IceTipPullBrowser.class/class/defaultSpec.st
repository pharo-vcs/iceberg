specs
defaultSpec
	<spec: #default>
	
	^ SpecLayout composed
		newColumn: [ :mainColumn |
			mainColumn
				newRow: #toolbar height: IceTipToolbar defaultHeight;
				newRow: [ :row |
					row 
						newColumn: #remoteLabel width: 100;
						newColumn: #remoteList ]
					height: self inputTextHeight;
				newRow: [ :row |
					row newColumn: [ :column |
						column 
							add: #commitsPanel withSpec: #panelSpec;
							add: #actionPanel height: self actionPanelHeight ] ] ]