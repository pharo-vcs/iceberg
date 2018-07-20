I am a project reader that knows how to return a project object from a commit.
New readers can be created by inheriting this class, and will be detected by inheritance.
Then, a reader must implement:

 - #canReadProjectFromCommitish: returns a boolean that indicates if the reader knows how to read the project
 - #readProjectFromCommitish: returns a project object