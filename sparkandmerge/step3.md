# Commit commands

We could now commit our changes with the commit command
The next command will commit all changes under master branch in th repository my-repo and add the message first commit:
`lakectl commit lakefs://my-repo@master --message "first commit"`{{execute}}

We could now list the commits with the log command
`lakectl log lakefs://my-repo@master`{{execute}}

we could see there two commits.

- our first commit
- an auto generated commit, Repository created

