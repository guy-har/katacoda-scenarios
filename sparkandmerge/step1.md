A repository is equivalent to a s3 bucket with git capabilities.

## Repository commands
Once LakeFS is Done initializing we will have a ready empty environment.

The first step we would like to do is add a repository. 
we will name it my_repo and call our main branch master 
`lakectl repo create lakefs://my-repo local://storage-location`{{execute}}

now we can list our repositories:
`lakectl repo list`{{execute}}

to see all available repository commands you could use --help:
`lakectl repo --help`{{execute}}


