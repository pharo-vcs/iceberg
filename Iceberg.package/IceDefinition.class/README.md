I represent the definition of an element in an Iceberg repository. My subclasses represent more concretely classes, traits, extensions, methods and files.

I am used to easily read and write from a repository working copy or commit. The Filetree or Tonel parser create IceDefinitions that are later on used to browse, generate diffs, or merges.

My main API is used to show myself in a diff or merge browser:

 - contents: textual value of the definition (e.g., the code of a class or a method, the contents of a file)
 - icon: the preferred icon to show this entity
 - accept: visitor API
 - is* to test which of my subclasses you're working with

I am also used for comparison to build diffs. See my definitions of equality along my subclasses.