## Bash Shell Scripting Basics

### Creating and Executing Bash shell scripts

* The command interpreter
```
#!/bin/bash
...
```

* Executing a Bash shell script
```bash
[student@server ~]$ which hello

[student@server ~]$ echo $PATH
```

### Displaying output
```bash
[student@server ~]$ cat hello

[student@server ~]$ ./hello
```

* Quoting special characters

```
[student@server ~]$ echo # not a comment

[student@server ~]$ echo \# not a comment
# not a comment

[student@server ~]$ echo # not a comment #

[student@server ~]$ echo \# not a comment #
# not a comment

[student@server ~]$ echo \# not a comment \#
# not a comment #

[student@server ~]$ echo '# not a comment #'
# not a comment #

[student@server ~]$ echo '$HOME'
$HOME

[student@server ~]$ echo '`pwd`'
`pwd`

[student@server ~]$ echo '"Hello, world"'
"Hello, world"

[student@server ~]$ echo "$HOME"
/home/student

[student@server ~]$ echo "`pwd`"
/home/student

[student@server ~]$ echo ""Hello, world""
Hello, world

[student@server ~]$ echo "\$HOME"
$HOME

[student@server ~]$ echo '\`pwd\`"
`pwd`

[student@server ~]$ echo "\"Hello, world\""
"Hello, world"
``

### Using variables
```
VARIABLENAME=value
```

### Using Bash shell expansion features
* Command substitution
```bash
[student@server ~]$ echo "Current time: `date`"
Current time: Thu Jun 5 16:24:24 EDT 2014

[student@server ~]$ echo "Current time: $(date)"
Current time: Thu Jun 5 16:24:24 EDT 2014
```

* Arithmetic expansion
```bash
[student@server ~]$ echo $[1+1]
2

[student@server ~]$ COUNT=1; echo $[$[$COUNT+1]*2]
4
```

### Iterating with the for loop
```
for <VARIABLE> in <LIST>; do
    <COMMAND>
    ...
    <COMMAND>
done
```

### Troubleshooting shell script bugs

* Debug and verbose modes
```
#!/bin/bash -x
```
