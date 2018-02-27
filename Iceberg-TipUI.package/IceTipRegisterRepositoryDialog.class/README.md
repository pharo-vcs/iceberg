I'm a dialog to register new repositories.
I can create new repositories, add existing ones and clone for different places (including a generic url clone).

self new 
	onAccept: [ :newRepository | newRepository register ];
	openDialogWithSpec