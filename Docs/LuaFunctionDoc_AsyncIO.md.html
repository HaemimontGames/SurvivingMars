# Documentation for *AsyncIO*

## Overview

These file operation functions block the Lua thread in which they are running, and return a value only when the operation is complete.<br>
Other Lua threads, however, continue running.<br>
<br>
The first return value is an error code, or nil if the operation succeeded.<br>
Some common errors that can occur are:<br>
* "missing param" - there are less params than required.<br>
* "string, pstr or string table expected" - the parameter type is wrong.<br>
* "filename expected" - the first param must be a filename.<br>

## AsyncCopyFile

Copies a file to a new file<br>

string err **AsyncCopyFile**(string filepathsrc, string filepathdst,[ string mode, int compression_level])
filepathsrc
: the file to copy.

filepathdst
: the file to copy to.

mode
: can be nil, "zlib" , "lz4hc", "lz4" ,"zstd" or "raw".

compression_level
: compression level for "zstd" compression, default is 0.

_returns_ string err
: nil if no error occurred or string explaining the error.


## AsyncCreatePath

Attempts to create the directory specified by pathname.<br>

string err **AsyncCreatePath**(string pathname)
pathname
: directory path to create.

_returns_ string err
: nil if no error occurred or string explaining the error why the path can not be created.


## AsyncExec

It passes command to be executed by an operating system shell.<br>

string err, int exitcode, string stdout, string stderr **AsyncExec**(string cmd, [string working_dir, bool hidden, bool capture_output, string priority])
string cmd
: command line to be executed.

string working_dir
: the directory in which to start execution, default i s"" means current directory.

bool hidden
: if true does not show command promt window during execution, default is false, 

bool capture_output
: return output in stdout, default false. 

string priority
: "normal"(default) or "belownormal" -  execution OS priority.

_returns_ string err
: nil if no error occurred or string explaining the system error.

_returns_ int exitcode
: the exitcode  after exicution or false.

_returns_ string stdout
: the content of the stdout  after exicution or false.

_returns_ string stderr
: the content of the stderr  after exicution or false.


## AsyncFileDelete

Deletes a file or directory.<br>

string err **AsyncFileDelete**(string pathname)
pathname
: the path to the file or the directory.

_returns_ string err
: nil if no error occurred or string explaining the error why the path can not be created.

~~~~ Lua
function remove_dir(dir)
	local err, files = AsyncListFiles(dir, '*', 'recursive')
	if err then return err end
	for i = 1, #files do
		err = AsyncFileDelete(files[i])
		if err then return err end
	end
	AsyncFileDelete(dir)
end
~~~~

## AsyncFileRename

Renames a file or directory.<br>

string err **AsyncFileRename**(string pathname)
pathname
: path to the file or the directory.

_returns_ string err
: nil if no error occurred or string explaining the error why the path can not be created.


## AsyncFileToString

Save the contents of specified file to string/table of strings.<br>
<br>

string err, data **AsyncFileToString**(string filepath,[int size,inf fileoffset,string mode, bool raw])
string filepath
: the path to the file ending with the file name.

int size
: positive number, the size of block that is saved to string.

int offset
: offset in the file to start from.

string mode
: return value format. Can be "string", "lines" - table with one element per line of the input file, "hash" to return only a hash of the file contents, "pstr" to return the data in a *pstr* string or "compress".

bool raw
: raw = true means do not decompress, default false.

_returns_ string err
: nil if no error occurred or string explaining the error.

_returns_ data
: string or array of strings if mode == "lines"; file contents


## AsyncGetFileAttribute

Returns the value of specified file attribute.<br>

string err, int attribute_value **AsyncGetFileAttribute**(string filename, string attribute)
filename
: the file path ending with the file name.

attribute
: 'timestamp' or 'size'.

_returns_ string err
: nil if no error occurred or string explaining the error why the path can not be created.

_returns_ int attribute_value
: the valueof specified attribute.


## AsyncListFiles

Returns table with files in the directory from specified type.<br>

string err, table files **AsyncListFiles**([string pathname, string mask, string mode])
pathname
: directory path, current application directory is used if not specified.

string mask
: mask for file types, default "*".

string mode
: string containing with one ore more from following separated with ',':

- "recursive" for recursive enumeration;<br>
- "folders" to return folders only instead of files;<br>
- "attributes" to have the attributes of each file in files.attributes;<br>
- "size" to have the size of each file in files.size;<br>
- "modified" to have a UNIX style modification timestamp of each file in files.modified;<br>
- "created" to have a creation timestamp of each file in files.created;<br>
- "relative" to return file paths relative to the search path;<br>
- "sorted" to sort files table in alphabetically order.<br>
~~~~ Lua
local err, files = AsyncListFiles()-- returns a table with all files and folders in app directory
local err, files = AsyncListFiles(any_dir, "*", "recursive, folders")-- returns a table with all directories ans sub directories to any_dir
~~~~
_returns_ string err
: nil if no error occurred or string explaining the error.

_returns_ table files
: a table with one filename per file listed in the array part, and optional additional arrays for attributes, size, modified, created if requested


## AsyncStringToFile

Outputs the content of specified string(s) to the specified file.<br>
<br>

string err **AsyncStringToFile**(string filepath, string str, [int offset, int timestamp, string compression_mode, int compression_level])
string filepath
: the path to the file ending with the file name.

string str
: can be a string or a table of strings that will be saved into the file.

int offset
: positive number meaning the file offset from which to start writing. Some specific values are: -2 - overwrite the entire file (default value) and -1 - append to the file.

string compression_mode
: can be "none" (default), "zlib", "lz4", "lz4hc", "zstd". Compression is applied only when overwriting the entire file (offset = -2).

int compression_level
: compression level for "zstd" compression, default is 0.

_returns_ string err
: nil if no error occurred or string explaining the error.


## AsyncWebRequest

Generates HTTP web request with parameters given in table.<br>

string err, string response **AsyncWebRequest**(table params)
table params
: table of used params - can contain:

- string url - url address for the web request;<br>
- string method - 'GET' or 'POST', default is 'GET';<br>
- table vars - url parameters for GET/POST methods;<br>
- table files - files to upload with POST method;<br>
- table headers - web request headers;<br>
- string body - custom request body<br>
- int max_response_size  - response content buffer size, default is 1024*1024.<br>
_returns_ string err
: nil if no error occurred, string explaining the system error or HTTP status code.

_returns_ string response
: returning response from the web request.





(insert footer.md.html here)
<!-- Markdeep: --><style class="fallback">body{visibility:hidden;white-space:pre;font-family:monospace}</style>
<script src="markdeep.min.js"></script>
<script src="https://casual-effects.com/markdeep/latest/markdeep.min.js"></script>
<script>window.alreadyProcessedMarkdeep||(document.body.style.visibility="visible")</script>