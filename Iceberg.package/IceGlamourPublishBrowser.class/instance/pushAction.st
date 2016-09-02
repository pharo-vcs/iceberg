action creators
pushAction
	 ^ GLMGenericAction new
			action: [ :presentation :repository | 
				[ 
					repository push. 
					presentation selection: nil 
				] 
				on: Error
				do: [ 
					self uiManager
						abort: 'Publish operation is not possible because your repository is out of date. 
Please update your local repository and retry.'
						title: 'Publishing aborted' 
				]
			];
			icon: GLMUIThemeExtraIcons glamorousRightSide;
			shortcut: $p;
			title: 'Publish all'; showTitle
				
