I've organized your content into clean, structured Markdown notes with headings, explanations, syntax, practical examples, and important command distinctions.

# Linux Command-Line Notes

## 1. Aliases: Creating Command Shortcuts

An **alias** allows you to create a shorter name for a command or a combination of commands.

It is useful when you frequently execute long commands and want to run them using a shorter name.

### 1.1 Understanding Aliases

For example, suppose you want to execute:

```bash
ls -lah
```

Instead of typing the entire command every time, you can create an alias called `twahir`.

First, try running:

```bash
twahir
```

If the alias does not exist, you will get:

```bash
command not found
```

### 1.2 Creating an Alias

**Syntax:**

```bash
alias shortcut_name='original_command'
```

**Example:**

```bash
alias twahir='ls -lah'
```

Now, whenever you execute:

```bash
twahir
```

The terminal executes:

```bash
ls -lah
```

### 1.3 Removing an Alias

To unregister or remove an existing alias, use `unalias`.

**Syntax:**

```bash
unalias alias_name
```

**Example:**

```bash
unalias twahir
```

The `twahir` shortcut is now removed.

### 1.4 Making Aliases Permanent

Aliases created directly in the terminal are temporary. They usually disappear when you close your terminal session.

To make them permanent, add them to your shell configuration file.

For Bash:

```bash
nano ~/.bashrc
```

Add:

```bash
alias twahir='ls -lah'
```

Save the file and reload the configuration:

```bash
source ~/.bashrc
```

Your alias will now be available in future Bash sessions.

> **Important:** Aliases are useful for shortening frequently used commands, similar to creating shortcuts for repetitive tasks in a TypeScript project.

---

## 2. Disk Management Commands

Linux provides commands to check available disk space and determine how much storage files and directories consume.

The two important commands are:

- `df` — Disk Free
- `du` — Disk Usage

### 2.1 df (Disk Free)

The `df` command displays information about available and used disk space across mounted filesystems.

**Basic syntax:**

```bash
df [options]
```

**Example:**

```bash
df
```

Displays disk space information in the default format.

For a more readable output, use:

```bash
df -h
```

The `-h` option means human-readable.

It displays sizes in units such as:

- KB (Kilobytes)
- MB (Megabytes)
- GB (Gigabytes)
- TB (Terabytes)

### 2.2 du (Disk Usage)

The `du` command displays how much disk space files and directories consume.

**Basic syntax:**

```bash
du [options] [directory]
```

#### Example 1: Check Home Directory Usage

```bash
du -sh ~
```

Explanation:

| Option | Meaning |
|---|---|
| `-s` | Summary: display only the total |
| `-h` | Human-readable format |
| `~` | Represents the current user's home directory |

This displays the total disk usage of your home directory.

#### Example 2: Check Individual Folder Sizes

```bash
du --max-depth=1 -h ~
```

Explanation:

| Option | Meaning |
|---|---|
| `--max-depth=1` | Display only the immediate contents of the directory |
| `-h` | Display sizes in a human-readable format |
| `~` | Start from the home directory |

This is particularly useful when your disk is filling up and you want to identify which folders are consuming the most storage.

**Example output:**

```text
2.5G    /home/user/Documents
8.0G    /home/user/Downloads
1.2G    /home/user/Pictures
15G     /home/user
```

You can quickly identify which directories consume the most space.

### 2.3 df vs du

| Command | Purpose | Example |
|---|---|---|
| `df` | Checks available and used filesystem space | `df -h` |
| `du` | Checks storage consumed by files and directories | `du -sh ~` |

**Remember:**

- Use `df` to check how much disk space is available.
- Use `du` to investigate which files or directories are consuming disk space.

---

## 3. Directory Navigation

### 3.1 cd - (Return to Previous Directory)

The `cd` command is used to change directories.

A particularly useful feature is:

```bash
cd -
```

It takes you back to the previous working directory.

**Example:**

Suppose you are currently in:

```text
/home/user/projects
```

You navigate to:

```bash
cd /var/log
```

Your current directory is now:

```text
/var/log
```

To return to your previous directory:

```bash
cd -
```

You will return to:

```text
/home/user/projects
```

**Use case:** Quickly switch between two directories without typing their full paths repeatedly.

---

# 4. Searching and Finding

Linux provides several powerful tools for searching files, directories, and text.

The three important concepts are:

1. `find` — Finds files and directories.
2. `grep` — Searches for text inside files.
3. `regex` — Defines patterns for advanced text matching.

---

## 5. find: Finding Files and Directories

The `find` command searches the filesystem for files and directories based on different conditions.

You can search based on:

- File or directory names.
- File types.
- File sizes.
- Modification dates.
- Permissions.

### 5.1 Basic Syntax

```bash
find [where_to_look] [conditions]
```

### 5.2 Find a File by Exact Name

Suppose you want to find a file called `config.json` in the current directory and its subdirectories.

```bash
find . -name "config.json"
```

Explanation:

| Part | Meaning |
|---|---|
| `find` | Search command |
| `.` | Start searching from the current directory |
| `-name` | Search using the filename |
| `"config.json"` | Name of the file |

### 5.3 Find Files by Extension

Suppose you want to find all `.log` files inside `/var/log`.

```bash
find /var/log -name "*.log"
```

The `*` is a wildcard that matches any characters before `.log`.

### 5.4 Find Only Directories

To find directories named `backup`:

```bash
find / -type d -name "backup"
```

Explanation:

| Option | Meaning |
|---|---|
| `/` | Start searching from the root directory |
| `-type d` | Search only for directories |
| `-name` | Match by name |
| `"backup"` | Directory name |

Searching from `/` can produce permission errors and take considerable time.

### 5.5 Find Only Files

To search for files named `config.json`:

```bash
find . -type f -name "config.json"
```

Here:

- `-type f` searches only for regular files.
- `-type d` searches only for directories.

### 5.6 Useful find Options

| Option | Description |
|---|---|
| `-name` | Search by filename (case-sensitive) |
| `-iname` | Search by filename (case-insensitive) |
| `-type f` | Find regular files |
| `-type d` | Find directories |
| `-size` | Search by file size |
| `-mtime` | Search by modification time |
| `-empty` | Find empty files or directories |

**Example: Case-insensitive search**

```bash
find . -iname "config.json"
```

This can match:

```text
config.json
CONFIG.JSON
Config.json
```

---

## 6. grep: Searching Text Inside Files

The `grep` command searches for specific words, phrases, or patterns inside files.

While `find` searches for files and directories, `grep` searches for text within those files.

### 6.1 Basic Syntax

```bash
grep "search_text" filename
```

### 6.2 Search for a Specific Word

Suppose you want to find lines containing the word `root` inside `/etc/passwd`.

```bash
grep "root" /etc/passwd
```

This displays every line containing the word `root`.

### 6.3 Case-Insensitive Search

By default, `grep` is case-sensitive.

For example, these are treated as different strings:

```text
error
ERROR
Error
```

To ignore uppercase and lowercase differences, use `-i`.

```bash
grep -i "error" system.log
```

This matches all three variations.

### 6.4 Recursive Search

Sometimes you want to search through multiple files inside a directory.

Use `-r` to search recursively.

**Example:**

```bash
grep -r "api_key" /var/www/html/
```

This searches for `api_key` inside files throughout `/var/www/html/` and its subdirectories.

> **Security note:** Be careful when searching for sensitive terms such as passwords or API keys. Avoid displaying or sharing actual secret values.

### 6.5 Display Line Numbers

Use `-n` to display the line number where a match occurs.

```bash
grep -n "error" system.log
```

### 6.6 Search for Whole Words

Use `-w` to match complete words rather than partial matches.

```bash
grep -w "root" /etc/passwd
```

This avoids matching `root` as part of a larger word.

### 6.7 Useful grep Options

| Option | Description |
|---|---|
| `-i` | Ignore case sensitivity |
| `-r` | Search recursively |
| `-n` | Display line numbers |
| `-w` | Match whole words |
| `-v` | Display lines that do not match |
| `-E` | Enable extended regular expressions |
| `-l` | Display filenames containing matches |
| `-c` | Count matching lines |

---

# 7. Regex: Regular Expressions

**Regex (Regular Expression)** is a pattern-matching language used to search for text based on specific patterns rather than exact words.

It is particularly useful when you don't know the exact text you're searching for.

For example, suppose you want to find:

- Phone numbers.
- Email addresses.
- IP addresses.
- Lines starting with a particular word.
- Text containing a specific number of digits.

Instead of searching for exact values, you define a pattern.

Regex can be used with many tools, including `grep`.

### 7.1 Common Regex Characters

| Character | Meaning | Example |
|---|---|---|
| `.` | Matches any single character except a newline | `c.t` |
| `[0-9]` | Matches any digit from 0 to 9 | `[0-9]` |
| `[a-z]` | Matches lowercase letters | `[a-z]` |
| `[A-Z]` | Matches uppercase letters | `[A-Z]` |
| `+` | Matches one or more occurrences of the preceding expression | `[0-9]+` |
| `*` | Matches zero or more occurrences | `ab*` |
| `?` | Matches zero or one occurrence | `colou?r` |
| `^` | Matches the beginning of a line | `^Admin` |
| `$` | Matches the end of a line | `error$` |
| `{n}` | Matches exactly n occurrences | `[0-9]{3}` |
| `{n,m}` | Matches between n and m occurrences | `[0-9]{2,4}` |
| `\.` | Matches a literal dot | `example\.com` |

### 7.2 Regex Examples Using grep

To use extended regular expressions with `grep`, add the `-E` option.

#### Example 1: Find Three Consecutive Digits

```bash
grep -E "[0-9][0-9][0-9]" numbers.txt
```

Alternatively, use a quantifier:

```bash
grep -E "[0-9]{3}" numbers.txt
```

Both expressions match three consecutive digits.

Examples of matching values:

```text
123
456
789
```

#### Example 2: Find Lines Starting with Admin

```bash
grep -E "^Admin" access.log
```

Explanation:

- `^` means the beginning of a line.
- `Admin` is the text being searched for.

This matches:

```text
Admin logged in
Admin changed settings
```

It does not match:

```text
User Admin logged in
```

Because `Admin` does not appear at the beginning of the line.

#### Example 3: Find Lines Ending with Error

```bash
grep -E "error$" system.log
```

Explanation:

- `error` is the search pattern.
- `$` means the end of a line.

This matches:

```text
Database connection error
Application error
```

But not:

```text
error occurred during startup
```

#### Example 4: Find an IP Address-Like Pattern

```bash
grep -E "[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+" network_traffic.txt
```

Explanation:

| Pattern | Meaning |
|---|---|
| `[0-9]+` | One or more digits |
| `\.` | A literal dot |
| Repeated groups | Four groups of digits separated by dots |

This matches strings such as:

```text
192.168.1.1
10.0.0.1
172.16.0.5
```

**Important:** This is a basic pattern, not a complete IP address validator. It can also match invalid IP values.

---

# 8. find vs grep vs regex

These three concepts are related but serve different purposes.

| Tool | Purpose | Example |
|---|---|---|
| `find` | Locate files and directories | `find . -name "config.json"` |
| `grep` | Search for text inside files | `grep "error" system.log` |
| `regex` | Define advanced search patterns | `grep -E "[0-9]{3}" numbers.txt` |

### Practical Example

Suppose you are working on a project and want to locate a configuration file containing a specific setting.

**Step 1: Find the configuration file.**

```bash
find . -name "config.json"
```

**Step 2: Search for the setting inside the file.**

```bash
grep "api_url" config.json
```

**Step 3: Use regex if you need to search for a more complex pattern.**

```bash
grep -E "[0-9]{3}" config.json
```

The general workflow is:

```text
find → Locate files
  ↓
grep → Search inside files
  ↓
regex → Match complex text patterns
```

---

# 9. Quick Command Reference

| Command | Description | Example |
|---|---|---|
| `alias` | Create a command shortcut | `alias ll='ls -lah'` |
| `unalias` | Remove an alias | `unalias ll` |
| `df` | Check filesystem disk space | `df -h` |
| `du` | Check directory disk usage | `du -sh ~` |
| `cd -` | Return to previous directory | `cd -` |
| `find` | Find files and directories | `find . -name "*.log"` |
| `grep` | Search text inside files | `grep "error" app.log` |
| `grep -i` | Case-insensitive search | `grep -i "error" app.log` |
| `grep -r` | Recursive text search | `grep -r "TODO" .` |
| `grep -n` | Show matching line numbers | `grep -n "root" file.txt` |
| `grep -E` | Search using extended regex | `grep -E "[0-9]{3}" file.txt` |

---

# 10. Key Takeaways

1. **Aliases** help you create shortcuts for frequently used commands.
2. **unalias** removes previously registered aliases.
3. **df** tells you how much disk space is available and used.
4. **du** helps identify which files and directories consume storage.
5. **cd -** takes you back to your previous working directory.
6. **find** locates files and directories based on specified conditions.
7. **grep** searches for text inside files.
8. **Regex** allows you to search using complex patterns rather than exact text.
9. **grep -E** enables extended regular expressions.
10. Combining `find`, `grep`, and regex makes searching through large projects much easier.

**The most important distinction to remember:**

- Need to find a file? Use `find`.
- Need to find text inside a file? Use `grep`.
- Need to find text matching a pattern? Use `grep -E` with regex.

**Suggested filename:** `linux-command-line-notes.md`

You can copy the entire document into a file with that name and open it in VS Code or any Markdown editor.