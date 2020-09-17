# Commit commands

We could now commit our changes with the commit command
`lakectl commit lakefs://my-repo@master --message "first commit"`{{execute}}

Now we could list the commits with the log command
`lakectl log lakefs://my-repo@master`{{execute}}

we could see there two commits.

- our first commit
- an auto generated commit, repositroy was created

