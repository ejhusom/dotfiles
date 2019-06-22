# Bash scripts

This README contains general information about creating bash scripts.

## Shebang

The first line of a bash script must be:
```bash
#!/bin/bash
```

## Modifying permissions

To be able to run bash scripts, permissions must be modified:
```bash
$ chmod +x [bashscript]
```

##  Variables

Set variables without spaces between key and value:
```bash
var="string"

echo $var
```
This means that ~~`var = "string"`~~ will not work.

## Taking input

Access command line arguments as:
```bash
$1  # first command line argument
$2  # second command line argument
$*  # all command line arguments
```

Read input:
```bash
read var

echo $var
```


## Conditionals


```bash
echo Height?
read height

if [ "$height" -lt 150 ]
then
    echo You are too low to ride roller coaster.
else
    echo You can ride roller coaster.
fi
```

It is important to have spaces on each side of the condition, inside the
brackets.

Conditional operators:

Operator    | Equivalent    | Description
---         | ---           | ---
-eq         | ==            | Equal
-ne         | !=            | Not equal
-lt         | <             | Less than
-le         | <=            | Less than or equal
-gt         | >             | Greater than
-ge         | >=            | Greater than or equal
-z          | == null       | Is null


## Loop


```bash

FILES=./*.py    # all .py files

for file in $FILES
do
    echo $(basename $file)
done
```

