"
Publish content of playground a github gist (in your user space)
"
Class {
	#name : 'IcePlaygroundPublishGistCommand',
	#superclass : 'StPlaygroundToolbarExtensionCommand',
	#category : 'Iceberg-Playground-Plugin-Gist-Command',
	#package : 'Iceberg-Playground-Plugin-Gist',
	#tag : 'Command'
}

{ #category : 'default' }
IcePlaygroundPublishGistCommand class >> defaultDescription [

	^ 'Publish contents as gist.'
]

{ #category : 'accessing' }
IcePlaygroundPublishGistCommand class >> defaultIconName [

	^ #github
]

{ #category : 'default' }
IcePlaygroundPublishGistCommand class >> defaultName [

	^ 'Publish Gist'
]

{ #category : 'accessing' }
IcePlaygroundPublishGistCommand class >> order [

	^ 6
]

{ #category : 'execution' }
IcePlaygroundPublishGistCommand >> execute [ 
	| contents |

	contents := self page contents.
	contents ifEmpty: [
		self application inform: 'Nothing was published because the playground is empty'.
		^ self ].

	(IcePublishGistPresenter newApplication: self application)
		content: contents withUnixLineEndings;
		whenPublishedDo: [ :jsonResult |
			self application inform: (jsonResult at: 'html_url') , ' was published and the url was copied to clipboard' ];
		openModal
]

{ #category : 'accessing' }
IcePlaygroundPublishGistCommand >> page [

	^ context page
]
