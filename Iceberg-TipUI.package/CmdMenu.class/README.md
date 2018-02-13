I represent abstract tree structure for concrete menu implementation like context menu, toolbar, halo menu and etc..
I am created for commands which have given #commandActivatorClass:
	menu := CmdMenu activatedBy: aCommandActivatorClass

Then I can build items for given context:
	menu buildInContext: aToolContext.
This method can be called multiple times for different contexts. It allows to build single menu for multiple parts of application. For example toolbar menu can include commands for all visible widgets.   
When menu is built you can inspect #rootGroup to analyze structure.

Concrete activator packages extend me to build concrete type of end user menu. For example context menu activator ask me to #buildContextMenu. Then I ask all my items to build context menu. And at the end commands receive context menu message where they build menu item morphs. 
 
Internal Representation and Key Implementation Points.

    Instance Variables
	commandActivatorClass:		<CmdMenuCommandActivator class>
	rootCommandClass:		<CmdCommand class>
	rootGroup:		<CmdMenuGroup class>