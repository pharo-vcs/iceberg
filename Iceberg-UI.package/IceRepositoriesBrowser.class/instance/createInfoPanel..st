building
createInfoPanel: detailedInfo
	| ui layout |
	ui := DynamicComposableModel new.
	layout := SpecLayout composed.
	layout	 newColumn: [ :column | 
		1 to: detailedInfo size do: [ :index | | label description |
			label := ('label_', index asString) asSymbol.
			description := ('desc_', index asString) asSymbol.
			ui instantiateModels: { label. #LabelModel. description. #TextInputFieldModel }.
			(ui perform: label) label: (detailedInfo at: index) key.
			(ui perform: description) 
				enabled: false;
				text: (detailedInfo at: index) value.
			column newRow: [ :c | c newColumn: label width: 100; newColumn: description ] height: 25 ]. 
		ui instantiateModels: {#spaces. #LabelModel}.
		column newRow: #spaces ]. 
	^ ui buildWithSpecLayout: layout