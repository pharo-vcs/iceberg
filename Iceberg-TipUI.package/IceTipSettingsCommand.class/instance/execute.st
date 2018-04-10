execution
execute
	| browser window path |
	
	browser := SettingBrowser new 
		changePackageSet: { 
			#'Iceberg' asPackage.
			#'Iceberg-Libgit' asPackage };
		yourself.
		 
	window := browser open.
	path := (window submorphs detect: [ :each | (each isKindOf: MorphTreeMorph)  ]) nodeList.
	browser expandNodePath: path first contents first contents first path.