# BASH COURSE — GROUP 3 & GROUP 4
**Environment:** Linux (Ubuntu/Zorin/Linux Mint/Debian)  
**Shell:** Bash  
**Level:** Beginner → Intermediate

These two groups will teach you how to manage files and directories, inspect their contents, manipulate text, and control how data moves through Linux.

We will use real terminal commands rather than only theoretical examples.

# GROUP 3: FILE AND DIRECTORY MANAGEMENT

**Objective:** Learn how to create, copy, move, rename, delete, and manage files and directories using Bash.

## 3.1 Creating Files

In Linux, you can create files directly from the terminal without opening a text editor.

### Important commands

| Command | Purpose |
|---|---|
| `touch` | Creates an empty file |
| `echo` | Creates a file containing text |
| `printf` | Writes formatted text into a file |
| `nano` | Creates or edits files using a terminal editor |
| `cat` | Can create files through input redirection |

### Examples

**1. Create an empty file**

```bash
touch hello.txt
```

This creates a file called `hello.txt` in your current directory.

**2. Create multiple files**

```bash
touch file1.txt file2.txt file3.txt
```

**3. Create a file containing text**

```bash
echo "Hello, Bash!" > hello.txt
```

The `>` operator writes the text into the file. If the file already contains something, its previous contents are replaced.

**4. Append text to an existing file**

```bash
echo "I am learning Linux" >> hello.txt
```

Unlike `>`, the `>>` operator adds content without deleting existing content.

**5. Create a file using nano**

```bash
nano hello.txt
```

You can type your content directly into the editor.

Useful nano shortcuts:

- `CTRL + O` — Save.
- `CTRL + X` — Exit.
- `CTRL + W` — Search.
- `CTRL + K` — Cut a line.

**Real-world application:**

Imagine you are developing Simamia and need to create a configuration file:

```bash
touch .env
```

You can then edit it:

```bash
nano .env
```

---

## 3.2 Creating Directories

A directory is essentially a container used to organize files and other directories.

### Important commands

| Command | Purpose |
|---|---|
| `mkdir` | Creates a directory |
| `mkdir -p` | Creates nested directories |
| `ls` | Lists directory contents |
| `rmdir` | Removes an empty directory |

### Examples

**1. Create a directory**

```bash
mkdir projects
```

**2. Create multiple directories**

```bash
mkdir frontend backend database
```

**3. Create nested directories**

```bash
mkdir -p projects/simamia/backend/api
```

This creates the entire directory structure, including parent directories that do not already exist.

**4. Create multiple nested directories**

```bash
mkdir -p projects/simamia/{frontend,backend,database,documentation}
```

This uses Bash brace expansion.

Result:

```text
projects/
└── simamia/
    ├── frontend/
    ├── backend/
    ├── database/
    └── documentation/
```

**5. Remove an empty directory**

```bash
rmdir projects
```

Note: `rmdir` only removes empty directories.

---

## 3.3 Copying Files

Copying means creating another version of a file or directory while keeping the original.

### Important commands

| Command | Purpose |
|---|---|
| `cp` | Copies files |
| `cp -r` | Copies directories recursively |
| `cp -i` | Asks before overwriting |
| `cp -v` | Displays copying operations |
| `cp -a` | Copies while preserving attributes |

### Examples

**1. Copy a file**

```bash
cp hello.txt backup.txt
```

You now have two files:

```text
hello.txt
backup.txt
```

**2. Copy a file into a directory**

```bash
cp hello.txt projects/
```

**3. Copy multiple files**

```bash
cp file1.txt file2.txt projects/
```

**4. Copy an entire directory**

```bash
cp -r projects backup_projects
```

The `-r` option means recursive. It allows the command to copy directories and their contents.

**5. Copy while preserving metadata**

```bash
cp -a projects backup_projects
```

**6. Ask before overwriting an existing file**

```bash
cp -i hello.txt backup.txt
```

This is useful when you want to avoid accidentally replacing important files.

---

## 3.4 Moving Files

Moving means relocating files or directories from one location to another.

### Important command

`mv` — Moves files and directories.

### Examples

**1. Move a file into a directory**

```bash
mv hello.txt projects/
```

**2. Move multiple files**

```bash
mv file1.txt file2.txt projects/
```

**3. Move a directory**

```bash
mv projects backup/
```

**4. Move a file to another location**

```bash
mv hello.txt /home/$USER/Documents/
```

**5. Move files with confirmation before overwriting**

```bash
mv -i hello.txt projects/
```

### Important distinction

`cp` creates a copy.

`mv` relocates the original.

---

## 3.5 Renaming Files

Linux does not require a separate rename command for basic renaming.

The `mv` command handles both moving and renaming.

### Examples

**1. Rename a file**

```bash
mv hello.txt welcome.txt
```

**2. Rename a directory**

```bash
mv projects development
```

**3. Change a file extension**

```bash
mv report.txt report.pdf
```

Important: Changing an extension does not convert the actual file format. It only changes the filename.

**4. Rename multiple files using a loop**

```bash
for file in *.txt; do
    mv "$file" "${file%.txt}.bak"
done
```

This changes every `.txt` filename in the current directory to `.bak`.

For example:

```text
file1.txt → file1.bak
file2.txt → file2.bak
file3.txt → file3.bak
```

---

## 3.6 Deleting Files and Directories

Deleting removes files and directories from the filesystem.

Be particularly careful here: Bash deletion commands can permanently remove data.

### Important commands

| Command | Purpose |
|---|---|
| `rm` | Deletes files |
| `rm -r` | Deletes directories recursively |
| `rm -f` | Forces deletion without prompting |
| `rm -i` | Requests confirmation |
| `rmdir` | Deletes empty directories |

### Examples

**1. Delete a file**

```bash
rm hello.txt
```

**2. Delete multiple files**

```bash
rm file1.txt file2.txt file3.txt
```

**3. Delete an empty directory**

```bash
rmdir projects
```

**4. Delete a directory containing files**

```bash
rm -r projects
```

**5. Delete with confirmation**

```bash
rm -i hello.txt
```

**6. Delete all `.txt` files in the current directory**

```bash
rm *.txt
```

### Important security warning

Avoid experimenting with commands like:

```bash
sudo rm -rf /
```

Recursive forced deletion can destroy your operating system and data.

For now, practice deletion only inside directories you created specifically for learning.

---

## 3.7 File Metadata

Metadata is information about a file rather than the actual content inside it.

Linux maintains several important file attributes.

### Important commands

| Command | Purpose |
|---|---|
| `ls -l` | Displays permissions, ownership, size and timestamps |
| `stat` | Displays detailed file metadata |
| `file` | Identifies file type |
| `chmod` | Changes file permissions |
| `chown` | Changes file ownership |
| `chgrp` | Changes group ownership |
| `touch` | Updates file timestamps |

### 1. View file metadata

```bash
ls -l hello.txt
```

Example output:

```text
-rw-r--r-- 1 user user 120 Nov 4 10:30 hello.txt
```

The output contains:

- `-rw-r--r--` — Permissions.
- `user` — Owner.
- `user` — Group.
- `120` — File size in bytes.
- `Nov 4 10:30` — Modification date and time.

### 2. View detailed metadata

```bash
stat hello.txt
```

This displays information such as:

- File size.
- Inode number.
- Permissions.
- Access time.
- Modification time.
- Change time.

### 3. Identify file type

```bash
file hello.txt
```

This helps identify the actual file type rather than relying only on its extension.

### 4. Change file permissions

Linux uses three main permission types:

| Permission | Symbol | Meaning |
|---|---|---|
| Read | `r` | Read file contents |
| Write | `w` | Modify file contents |
| Execute | `x` | Execute a file as a program |

There are three permission categories:

- `u` — Owner.
- `g` — Group.
- `o` — Others.

Example:

```bash
chmod 755 script.sh
```

This gives:

- Owner: Read, write, execute.
- Group: Read, execute.
- Others: Read, execute.

Another example:

```bash
chmod 644 hello.txt
```

This gives:

- Owner: Read and write.
- Group: Read.
- Others: Read.

### 5. Change file ownership

```bash
sudo chown username hello.txt
```

Change both owner and group:

```bash
sudo chown username:groupname hello.txt
```

This is commonly used when managing Linux servers.

**Practical application:** When deploying a Node.js application to a Linux server, you may need to adjust file permissions and ownership so that the application runs under the correct user.

---

---

# GROUP 4: FILE CONTENT MANAGEMENT

**Objective:** Learn how to read, inspect, search, modify, and compare file contents using Bash.

## 4.1 Reading Files

Reading files means displaying their contents directly in the terminal.

### Important commands

| Command | Purpose |
|---|---|
| `cat` | Displays file contents |
| `less` | Reads files interactively |
| `more` | Displays files page by page |
| `head` | Displays the beginning of a file |
| `tail` | Displays the end of a file |

### Examples

**1. Read an entire file**

```bash
cat hello.txt
```

**2. Read multiple files**

```bash
cat file1.txt file2.txt
```

This displays the contents of both files.

**3. Display a file with line numbers**

```bash
cat -n hello.txt
```

**4. Display only non-empty line numbers**

```bash
cat -b hello.txt
```

**5. Display the first 10 lines**

```bash
head hello.txt
```

**6. Display the last 10 lines**

```bash
tail hello.txt
```

**7. Display the first 5 lines**

```bash
head -n 5 hello.txt
```

**8. Display the last 20 lines**

```bash
tail -n 20 hello.txt
```

### Real-world application: Server logs

Suppose your Node.js application generates a log file:

```bash
cat application.log
```

If the log contains thousands of lines, displaying everything is inefficient.

Instead:

```bash
tail -n 50 application.log
```

This displays the latest 50 lines.

---

## 4.2 Viewing Large Files

When working with large files, you should avoid unnecessarily loading their entire contents into your terminal.

### Important commands

| Command | Purpose |
|---|---|
| `less` | Interactive file viewing |
| `more` | Page-by-page viewing |
| `head` | Inspecting the beginning |
| `tail` | Inspecting the end |
| `tail -f` | Following continuously updated files |

### Examples

**1. Open a file using less**

```bash
less application.log
```

Useful keyboard shortcuts:

| Key | Action |
|---|---|
| `Space` | Move down one page |
| `b` | Move up one page |
| `Enter` | Move down one line |
| `/error` | Search for error |
| `n` | Find next match |
| `N` | Find previous match |
| `g` | Go to beginning |
| `G` | Go to end |
| `q` | Quit |

**2. Read the beginning of a large file**

```bash
head -n 30 application.log
```

**3. Read the latest entries**

```bash
tail -n 30 application.log
```

**4. Monitor a log file continuously**

```bash
tail -f application.log
```

This is particularly useful when debugging applications.

For example, you can keep this command running while testing your backend API. New log entries will appear automatically.

To stop monitoring:

```text
CTRL + C
```

**5. Monitor multiple log files**

```bash
tail -f app.log error.log
```

---

## 4.3 Searching Text

Sometimes you have thousands of files and need to locate a specific word, phrase, or pattern.

Linux provides powerful searching commands.

### Important commands

| Command | Purpose |
|---|---|
| `grep` | Searches for text patterns |
| `find` | Searches for files and directories |
| `locate` | Finds files using an indexed database |
| `which` | Finds the executable location of a command |
| `whereis` | Locates binaries, source files and manuals |

### A. Using grep

**1. Search for a word**

```bash
grep "error" application.log
```

This displays lines containing `error`.

**2. Ignore uppercase and lowercase differences**

```bash
grep -i "error" application.log
```

It matches:

```text
error
ERROR
Error
ErRoR
```

**3. Display matching line numbers**

```bash
grep -n "error" application.log
```

**4. Count matching lines**

```bash
grep -c "error" application.log
```

**5. Search recursively inside directories**

```bash
grep -r "database" projects/
```

This searches files inside `projects/` and its subdirectories.

**6. Display lines that do not contain a specific word**

```bash
grep -v "success" application.log
```

**7. Search for multiple patterns**

```bash
grep -E "error|warning|failed" application.log
```

This searches for any of the three patterns.

### B. Using find

`find` searches for files and directories based on their names, types, timestamps, permissions, and other attributes.

**1. Find a file by name**

```bash
find . -name "hello.txt"
```

The `.` means search from the current directory.

**2. Find all `.txt` files**

```bash
find . -name "*.txt"
```

**3. Search without considering uppercase/lowercase**

```bash
find . -iname "*.TXT"
```

**4. Find directories only**

```bash
find . -type d
```

**5. Find files only**

```bash
find . -type f
```

**6. Find files larger than 10 MB**

```bash
find . -type f -size +10M
```

**7. Find files modified within the last 24 hours**

```bash
find . -type f -mtime -1
```

### Difference between grep and find

| Command | Searches for |
|---|---|
| `grep` | Text inside files |
| `find` | Files and directories themselves |

Example:

```bash
grep -r "password" projects/
```

Finds the word `password` inside files.

```bash
find projects/ -name "*.env"
```

Finds files whose names end in `.env`.

---

## 4.4 Text Processing

Text processing involves extracting, filtering, sorting, transforming, and analyzing information stored in files.

This is particularly important in Linux administration, DevOps, log analysis, and automation.

### Important commands

| Command | Purpose |
|---|---|
| `wc` | Counts lines, words and characters |
| `cut` | Extracts specific fields |
| `sort` | Sorts lines |
| `uniq` | Identifies consecutive duplicate lines |
| `tr` | Translates or removes characters |
| `sed` | Modifies text streams |
| `awk` | Processes structured text |
| `paste` | Combines lines from files |

### A. wc — Counting information

**Count lines:**

```bash
wc -l hello.txt
```

**Count words:**

```bash
wc -w hello.txt
```

**Count bytes:**

```bash
wc -c hello.txt
```

**Count characters:**

```bash
wc -m hello.txt
```

### B. cut — Extracting fields

Suppose you have a file named `users.csv`:

```text
John,25,Tanzania
Mary,30,Kenya
David,28,Uganda
```

Extract the first column:

```bash
cut -d ',' -f 1 users.csv
```

Output:

```text
John
Mary
David
```

Explanation:

- `-d ','` specifies the delimiter.
- `-f 1` selects the first field.

Extract the first and third columns:

```bash
cut -d ',' -f 1,3 users.csv
```

### C. sort — Sorting data

```bash
sort users.csv
```

Sort numbers:

```bash
sort -n numbers.txt
```

Sort in reverse order:

```bash
sort -r names.txt
```

### D. uniq — Handling duplicates

Suppose `names.txt` contains:

```text
John
John
Mary
David
David
```

Run:

```bash
sort names.txt | uniq
```

Output:

```text
David
John
Mary
```

Count occurrences:

```bash
sort names.txt | uniq -c
```

Output:

```text
2 David
2 John
1 Mary
```

Important: `uniq` normally identifies consecutive duplicate lines. Sorting first ensures identical entries are grouped together.

### E. tr — Translating characters

Convert lowercase letters to uppercase:

```bash
echo "hello world" | tr 'a-z' 'A-Z'
```

Output:

```text
HELLO WORLD
```

Replace spaces with underscores:

```bash
echo "hello world" | tr ' ' '_'
```

Output:

```text
hello_world
```

### F. sed — Editing text

Replace a word:

```bash
sed 's/hello/hi/' hello.txt
```

This displays the modified content without changing the original file.

Replace every occurrence on each line:

```bash
sed 's/hello/hi/g' hello.txt
```

Modify the actual file:

```bash
sed -i 's/hello/hi/g' hello.txt
```

Be careful with `-i`: it changes the original file.

### G. awk — Processing structured data

Using the previous `users.csv`:

```bash
awk -F ',' '{print $1}' users.csv
```

This extracts the first column.

Extract names and ages:

```bash
awk -F ',' '{print $1, $2}' users.csv
```

Find users older than 26:

```bash
awk -F ',' '$2 > 26 {print $1, $2}' users.csv
```

Output:

```text
Mary 30
David 28
```

**Real-world application:**

Imagine you have 10,000 application log entries and want to identify the most frequent errors.

You can combine commands:

```bash
grep "ERROR" application.log | sort | uniq -c | sort -nr
```

This:

1. Extracts error entries.
2. Sorts them.
3. Counts repeated entries.
4. Sorts the results by frequency.

This is a basic example of Linux log analysis.

---

## 4.5 File Comparison

File comparison allows you to identify differences between files.

This is useful when checking configuration changes, comparing backups, reviewing code changes, and troubleshooting deployments.

### Important commands

| Command | Purpose |
|---|---|
| `diff` | Displays differences between text files |
| `cmp` | Compares files byte by byte |
| `comm` | Compares sorted files line by line |
| `md5sum` | Calculates MD5 checksums |
| `sha256sum` | Calculates SHA-256 checksums |

### A. diff

Suppose you have two files.

`version1.txt`:

```text
Name: John
Age: 25
Country: Tanzania
```

`version2.txt`:

```text
Name: John
Age: 26
Country: Tanzania
```

Run:

```bash
diff version1.txt version2.txt
```

Output:

```text
2c2
< Age: 25
---
> Age: 26
```

This tells you that line 2 differs.

### B. Compare files with unified output

```bash
diff -u version1.txt version2.txt
```

This provides a more readable comparison, similar to what you see in Git.

### C. cmp

```bash
cmp version1.txt version2.txt
```

This identifies the first byte position where the files differ.

If the files are identical, `cmp` produces no output and returns a successful exit status.

### D. comm

```bash
comm file1.txt file2.txt
```

This compares two sorted files and identifies lines that are unique to either file or common to both.

### E. sha256sum

```bash
sha256sum version1.txt
```

This generates a SHA-256 checksum.

You can compare checksums to determine whether two files have identical content.

For example:

```bash
sha256sum version1.txt version2.txt
```

Identical hashes indicate identical file contents, assuming the same hashing algorithm.

**Real-world application:**

Before replacing a production configuration file, you can compare the existing version with your proposed version:

```bash
diff -u production.env new-production.env
```

This helps identify unintended changes.

---

---

## 4.6 Input and Output

This is one of the most important Bash concepts.

Every Linux command generally works with three standard data streams:

| Stream | Number | Purpose |
|---|---:|---|
| Standard Input (stdin) | 0 | Receives input |
| Standard Output (stdout) | 1 | Produces normal output |
| Standard Error (stderr) | 2 | Produces error messages |

Bash allows you to redirect these streams.

### A. Output Redirection (`>`)

Sends command output into a file.

```bash
echo "Hello Linux" > output.txt
```

Instead of displaying the text in your terminal, Bash saves it in `output.txt`.

**Important:** If the file already exists, its previous contents are overwritten.

### B. Append Redirection (`>>`)

Adds output to an existing file without deleting its previous contents.

```bash
echo "Learning Bash" >> output.txt
```

### C. Input Redirection (`<`)

Uses a file as the input to a command.

```bash
sort < names.txt
```

Bash reads `names.txt` and passes its contents to `sort`.

You can also use:

```bash
wc -l < names.txt
```

This counts the lines in the file.

### D. Error Redirection (`2>`)

Redirects error messages into a file.

Example:

```bash
ls nonexistent_directory 2> errors.log
```

Instead of displaying the error in your terminal, Bash saves it in `errors.log`.

### E. Redirecting Both Output and Errors

```bash
command > output.log 2>&1
```

This redirects both standard output and standard error into `output.log`.

Another modern Bash syntax:

```bash
command &> output.log
```

Both approaches capture normal output and errors.

### F. Discarding Output

Linux provides a special location called `/dev/null`.

Think of it as a destination that discards anything sent to it.

Example:

```bash
command > /dev/null
```

Discard error messages:

```bash
command 2> /dev/null
```

Discard both:

```bash
command &> /dev/null
```

### G. Pipes (`|`)

A pipe takes the output of one command and passes it directly as input to another command.

Example:

```bash
cat users.txt | sort
```

This reads `users.txt` and sends its contents to `sort`.

You can combine multiple commands:

```bash
cat users.txt | sort | uniq
```

This reads, sorts, and removes consecutive duplicate lines.

Another example:

```bash
ps aux | grep node
```

This searches running processes for entries containing `node`.

**Important distinction:**

| Operator | Purpose |
|---|---|
| `>` | Write output, replacing existing content |
| `>>` | Append output |
| `<` | Read input from a file |
| `2>` | Redirect errors |
| `\|` | Pass output to another command |
| `&>` | Redirect output and errors |

---

# PRACTICAL LAB: BUILD YOUR FIRST FILE MANAGEMENT SYSTEM

Now let's combine what you've learned.

Imagine you are managing a software development project called `simamia`.

We want to create a directory structure, generate files, insert information, search content, and manage backups.

### Step 1: Create the project structure

```bash
mkdir -p bash-practice/simamia/{frontend,backend,database,logs,backups}
```

### Step 2: Create files

```bash
touch bash-practice/simamia/backend/app.js

touch bash-practice/simamia/backend/config.txt

touch bash-practice/simamia/logs/application.log

touch bash-practice/simamia/database/users.csv
```

### Step 3: Insert information

```bash
echo "Application started successfully" > bash-practice/simamia/logs/application.log

echo "ERROR: Database connection failed" >> bash-practice/simamia/logs/application.log

echo "WARNING: High memory usage" >> bash-practice/simamia/logs/application.log
```

### Step 4: Read the logs

```bash
cat bash-practice/simamia/logs/application.log
```

### Step 5: Search for errors

```bash
grep -n "ERROR" bash-practice/simamia/logs/application.log
```

### Step 6: Count log entries

```bash
wc -l bash-practice/simamia/logs/application.log
```

### Step 7: Create a backup

```bash
cp -a bash-practice/simamia bash-practice/simamia-backup
```

### Step 8: Compare the original and backup

```bash
diff -r bash-practice/simamia bash-practice/simamia-backup
```

No output means the directories currently have identical contents.

### Step 9: Inspect file metadata

```bash
stat bash-practice/simamia/logs/application.log
```

### Step 10: Change permissions

```bash
chmod 640 bash-practice/simamia/logs/application.log
```

Congratulations. You've just performed basic filesystem management and log administration using Bash.

---

# YOUR PRACTICAL EXERCISES

Before moving to the next group, complete these exercises without copying the solutions.

| No. | Exercise | Expected result |
|---|---|---|
| 1 | Create a directory called `linux-lab`. | Directory exists. |
| 2 | Inside it, create `documents`, `scripts`, and `backups`. | Three directories exist. |
| 3 | Create `notes.txt` inside documents. | Empty file exists. |
| 4 | Insert five different lines into notes.txt. | File contains five lines. |
| 5 | Display the file with line numbers. | Five numbered lines. |
| 6 | Copy notes.txt into backups. | Backup copy exists. |
| 7 | Rename the backup to `notes-backup.txt`. | New filename exists. |
| 8 | Search for a particular word in notes.txt. | Matching line appears. |
| 9 | Display the number of lines and words. | Correct counts appear. |
| 10 | Compare the original and backup. | No differences initially. |
| 11 | Modify the original file. | Original has changed. |
| 12 | Compare both files again. | Differences appear. |
| 13 | Change the original file's permissions to 600. | Only owner has read/write access. |
| 14 | Display the original file's metadata. | Permissions, size and timestamps appear. |
| 15 | Delete the entire linux-lab directory. | Directory is removed. |

---

# Knowledge Check

Answer these questions to test whether you understand the concepts.

**1.** What is the difference between `cp` and `mv`?

**2.** What happens when you execute:

```bash
echo "Hello" > test.txt
```

when `test.txt` already contains information?

**3.** What is the difference between `>` and `>>`?

**4.** Which command would you use to find all `.log` files inside a directory and its subdirectories?

**5.** What is the difference between `grep` and `find`?

**6.** What does this command do?

```bash
grep "ERROR" app.log | sort | uniq -c
```

**7.** What is the difference between `chmod 755` and `chmod 644`?

**8.** What does `tail -f application.log` do?

**9.** What is the purpose of `/dev/null`?

**10.** Explain the difference between stdin, stdout, and stderr.

---

## What you should be able to do after these groups

You should now understand how to:

- Create and organize project directories.
- Create, copy, move, rename, and delete files.
- Inspect file permissions, ownership, and metadata.
- Read and monitor application logs.
- Search for information inside files.
- Extract and manipulate text.
- Compare configuration files and backups.
- Redirect input, output, and errors.
- Combine multiple Linux commands using pipes.

**My recommendation:** Don't rush into Groups 5–11 yet. Complete the practical exercises and knowledge check first. Bash becomes much easier when you understand what happens to files and data at the filesystem level.

When you finish, send me your exercise commands and answers. I'll review them as a technical instructor, identify mistakes, and explain corrections before we advance.