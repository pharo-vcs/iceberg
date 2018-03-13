I'm a filter function to be used by subclassing and implementing #matches: method.
I filter tree leafs, keeping the parent branches alive to show where selected elements come from.

To work, the elements of the tree I use need to be instances of the IceTipTreeNode hierarchy.