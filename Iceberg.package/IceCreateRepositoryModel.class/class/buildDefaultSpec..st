specs
buildDefaultSpec: col
	col
		newRow: [:row | row
			add: #localDirectoryLabel width: 100;
			add: #localDirectory;
			add: #changeLocationButton width: self buttonWidth  ]
		height: self inputTextHeight;
		
		newRow: [:row | row 
			add: #subdirectoryLabel width: 100;
			add: #subdirectory ]
		height: self inputTextHeight;
			
		add: #createButton height: self buttonHeight 

