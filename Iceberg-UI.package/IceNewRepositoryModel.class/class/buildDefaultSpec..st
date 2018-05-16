specs
buildDefaultSpec: col
	col
		newRow: [:row | row
			add: #projectNameLabel width: 100;
			add: #projectNameInput ]
			height: self inputTextHeight;
		newRow: #localDirectoryLocation 
			height: self inputTextHeight;
		newRow: [:row | row 
			add: #subdirectoryLabel width: 100;
			add: #subdirectory ]
			height: self inputTextHeight;
		add: #createButton height: self buttonHeight 

