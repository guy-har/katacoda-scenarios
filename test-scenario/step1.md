A repository is equivilant to an s3 bucket with git capabilities.

## Repository commands

Add your first repository 
we will name it my_repo and call our main branch master 

`lakectl repo create lakefs://my-repo local://storage-location` {{execute}}

now we can list our repositories:
`lakectl repo list` {{execute}}

to see available repository commands:
`lakectl repo --help` {{execute}}
