There are many places where Iceberg can be improved. Some are due to missing knowledge, others from lack of resources (it goes without saying that all help is greatly appreciated). Apart from fixing issue and perfroming reviews, this page explains several standalone sub-projects where people could usefully help to improve Iceberg's general quality, in a smaller space.

# Support Exporting without committing

There is no UI support for this, but it is doable from the backend although not correctly exposed.

You can right-click on the repository -> Extras -> Inspect
```
repository index updateDiskWorkingCopy: repository workingCopy workingCopyDiff.
```

# OAuth token authentication support

Some hostings allow users to generate an authentication token which can then be used to authenticate instead of inserting a user/password. There is missing UI support for this, and it needs further testing.

https://stackoverflow.com/questions/25409700/using-gitlab-token-to-clone-without-authentication
https://stackoverflow.com/questions/42148841/github-clone-with-oauth-access-token


# Two-factor authentication

If you have two-factor authentication enabled in your server (e.g., in github), you should be prompted for a code in order to give access to the repository. Iceberg misses support for this.

https://blog.github.com/2013-09-03-two-factor-authentication/

# Keychain/Similar support

Nobody wants to store their passwords in clear text, nor in memory, and not in a file on disk. Several systems such as Keychain exist to store passwords securely on your machine. We could add support to remember all different passwords required by iceberg for pulling, pushing, or accessing the github API.