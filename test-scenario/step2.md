# Reading and writing lakeFS files.

Once we have a repository 

we could add a file by using the fs command
add with source
`lakectl fs upload lakefs://my-repo@master/imdb/name.basics.tsv.gz --source ~/name.basics.tsv.gz`{{execute}}

add with stdin
`echo "this is a sample" | lakectl fs upload lakefs://my-repo@master/sample/wow.txt --source -`{{execute}}
 
lets use the list command
`lakectl fs ls lakefs://my-repo@master/`{{execute}}
 
`lakectl fs ls lakefs://my-repo@master/sample/`{{execute}} 
 
 
View the object metadata
`lakectl fs stat lakefs://my-repo@master/sample/wow.txt`{{execute}}

Dump the contenct of a file 
`lakectl fs cat lakefs://my-repo@master/sample/wow.txt`{{execute}}

Remove the file with the rm command
`lakectl fs rm lakefs://my-repo@master/sample/wow.txt`{{execute}}

Now you could list again to check if the file has been deleted. 


