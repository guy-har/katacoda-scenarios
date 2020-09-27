# Reading and writing lakeFS objects.

Once we have a repository 

we could add an object to lakeFS by using the fs command

Add an object from an existing source.
The following command will add the object title.episode.tsv.gz to lakeFS under the path /imdb/title.episode.tsv.gz in branch master. 
`lakectl fs upload lakefs://my-repo@master/imdb/title.episode.tsv.gz --source title.episode.tsv.gz`{{execute}}

Add an object using stdin,
The following command will add the object object.txt under path /sample in branch master
`echo "this is a sample" | lakectl fs upload lakefs://my-repo@master/sample/object.txt --source -`{{execute}}

We could now use the ls command to list the objects in our repository
`lakectl fs ls lakefs://my-repo@master/`{{execute}}
 
We got the paths under root, imdb and sample
If we would like to see the objects and paths under sample:
`lakectl fs ls lakefs://my-repo@master/sample/`{{execute}} 
 
To view the objects metadata we could use the stat command:
`lakectl fs stat lakefs://my-repo@master/sample/object.txt`{{execute}}

To dump the content of a object use the cat command:
`lakectl fs cat lakefs://my-repo@master/sample/object.txt`{{execute}}

Remove the object with the rm command
`lakectl fs rm lakefs://my-repo@master/sample/object.txt`{{execute}}

Now you could list again to check if the file has been deleted. 


