I am a toolbar. 
I can create toolbars to be added to spec windows (usually on top).

You can instantiate it in a Spec component as is:

toolbar := self instantiate: IceTipToolbar.
toolbar displayModel: IceTipToolbarDisplayMode modeIconAndLabel.
toolbar addItem: (IceTipToolbarItem new
	label: 'Test';
	icon: #add asIcon;
	position: IceTipToolbarItemPosition left;
	yourself)