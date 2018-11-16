actions
accept
	| items |
	
	"ensure window goes away (in case accept comes from a keybinding and not the ok button)"
	self window delete. 
	
	items := self packagesList widget dataSource selectedItems.
	items ifEmpty: [ 
		UIManager default inform: 'No packages selected.'.
		^ self ].
	
	self model addPackages: items