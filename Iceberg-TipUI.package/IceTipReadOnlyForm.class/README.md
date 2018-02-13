I'm a "read only form", used to display data in a more readable way than a list morph or a panel morph.
I receive a list of "label" and "values", being label a string and value a string or text object.

I can show lists of elements as this example shows: 

IceTipReadOnlyForm new 
	addLabel: 'Commit:' value: 'a test';
	addLabel: 'Parents:' value: '123456789';
	addLabel: 'Author:' value: 'Some Author <author@email.net>';
	addLabel: 'Date:' value: DateAndTime now asStringYMDHM;
	addLabel: 'Labels:' value: '';
	addLabel: 'Comment' value: String loremIpsum;
	openWithSpec.
	