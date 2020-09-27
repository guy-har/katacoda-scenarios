
So, let's commit the spark changes

Before we commit let's see the changes we are about to commit.
`lakectl diff lakefs://my-repo@my-branch`{{execute}}

Looks good, let's commit:
`lakectl commit lakefs://my-repo@my-branch --message "after spark job"`{{execute}}


Now we could merge our changes back to master.

First let's see the changes we are about to push,
We will do that by running the diff command on my-branch and master:
`lakectl diff lakefs://my-repo@my-branch lakefs://my-repo@master`{{execute}}

After verifying we could merge back
`lakectl merge lakefs://my-repo@my-branch lakefs://my-repo@master`{{execute}}

That's it :) we Merged our changes

Feel free to play around with the environment 
