accessing
browserContextActivation
	<classAnnotation>
	
	"The Default option when double clicking should be the first in the menu"
	^ CmdContextMenuCommandActivation 
		byRootGroupItemOrder: 1
		for: IceTipRepositoryListContext