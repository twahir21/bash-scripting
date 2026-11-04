# BASH COURSE — GROUP 1 & GROUP 2
**Environment:** Linux (Ubuntu / Zorin OS / Linux Mint / Debian)  
**Shell:** Bash  
**Level:** Beginner → Intermediate

These two groups establish the foundation for everything else in Bash. Before writing scripts or automating Linux systems, you need to understand how Bash works, how Linux organizes files, and how to navigate the filesystem efficiently.

We will use practical terminal commands and real-world software development examples.

# GROUP 1: BASH FUNDAMENTALS

**Objective:** Understand Bash, its relationship with Linux, how commands are executed, and how to interact with the operating system through the terminal.

## 1.1 Introduction to Bash

### What is Bash?

Bash stands for **Bourne Again Shell**.

It is a command-line interpreter that allows users to communicate with an operating system by entering commands.

Instead of interacting with Linux entirely through graphical interfaces, you can use Bash to:

- Create and manage files.
- Install software.
- Manage users and permissions.
- Configure servers.
- Run applications.
- Automate repetitive tasks.
- Manage databases.
- Deploy applications.
- Monitor system resources.

For example:

```bash
mkdir my-project
```

This tells Linux to create a directory called `my-project`.

Another example:

```bash
sudo apt update
```

This instructs a Debian-based Linux system to refresh its package information.

### History of Bash

Understanding its history helps explain why it is widely used.

| Year | Event |
|---|---|
| 1971 | Unix was introduced at Bell Labs. |
| 1977 | The Bourne shell (sh) was introduced. |
| 1989 | Bash was initially released by Brian Fox. |
| 1990s | Bash became widely adopted across GNU/Linux systems. |
| Today | Bash remains one of the most widely used shells in Linux environments. |

Bash was developed as part of the GNU Project, providing an enhanced replacement for the traditional Bourne shell.

### Bash vs Linux

These are not the same thing.

| Linux | Bash |
|---|---|
| An operating system kernel. | A command-line interpreter. |
| Manages hardware and system resources. | Allows users to execute commands. |
| Handles processes and memory management. | Provides an interface for interacting with the system. |
| Runs underneath user applications. | Runs as a user-space program. |

**Example:**

When you execute:

```bash
ls
```

Bash interprets your command and requests the operating system to execute the corresponding program.

### Where is Bash used in the real world?

1. **Software development:** Running development commands and managing projects.
2. **DevOps:** Automating deployment and infrastructure operations.
3. **Cloud engineering:** Managing remote Linux servers.
4. **Cybersecurity:** Automating security checks and system administration.
5. **System administration:** Managing users, permissions, processes, and services.

For example, a developer might use Bash to deploy a Node.js application:

```bash
git pull
npm install
npm run build
```

These commands can also be combined into a deployment script.

---

## 1.2 Shell vs Terminal vs Command Line

These three terms are related, but they have different meanings.

### A. What is a Shell?

A shell is a program that interprets commands and allows users to interact with the operating system.

Examples of shells:

| Shell | Description |
|---|---|
| Bash | Bourne Again Shell; widely used in Linux. |
| Zsh | An interactive shell with extensive customization. |
| Fish | A user-friendly shell with helpful interactive features. |
| Dash | A lightweight POSIX-compatible shell. |
| Ksh | KornShell, another Unix shell. |
| Sh | Traditional Unix shell interface, commonly linked to different implementations. |

### B. What is a Terminal?

A terminal is an application that provides a text-based interface where you can interact with a shell.

Examples:

- GNOME Terminal.
- KDE Konsole.
- Xfce Terminal.
- Tilix.
- Alacritty.

On your Linux desktop, when you open the Terminal application, you are opening a program that allows you to interact with Bash or another configured shell.

### C. What is the Command Line?

The command line is the text-based interface where you enter commands.

For example:

```bash
pwd
```

You type this command into the command line, and Bash interprets it.

### Understanding the relationship

Think of it this way:

```text
                 YOU
                  |
                  |
             COMMAND LINE
                  |
                  |
               TERMINAL
                  |
                  |
                BASH
                  |
                  |
             LINUX KERNEL
                  |
                  |
               HARDWARE
```

This is a simplified conceptual model. The terminal displays the interface, Bash interprets commands, and the kernel provides operating-system services.

### Practical demonstration

Open your Linux terminal.

Execute:

```bash
echo "Hello from Bash"
```

You should see:

```text
Hello from Bash
```

Now execute:

```bash
echo $SHELL
```

You may see:

```text
/bin/bash
```

This indicates that your configured login shell is Bash.

To identify the shell currently executing your commands, use:

```bash
ps -p $$ -o comm=
```

If Bash is running, the output should be:

```text
bash
```

---

## 1.3 Bash Environment

The Bash environment refers to the variables, settings, configuration, and execution context available to your Bash session.

It determines how Bash behaves and what resources it can access.

### A. Understanding your current environment

Execute:

```bash
env
```

This displays environment variables available to your current process.

You might see:

```text
HOME=/home/user
USER=user
SHELL=/bin/bash
PATH=/usr/local/bin:/usr/bin:/bin
LANG=en_US.UTF-8
```

Your actual values may differ.

### B. Important environment variables

| Variable | Purpose |
|---|---|
| `$HOME` | Your home directory. |
| `$USER` | Your current username. |
| `$SHELL` | Your configured login shell. |
| `$PATH` | Directories searched for executable commands. |
| `$PWD` | Your current working directory. |
| `$OLDPWD` | Your previous working directory. |
| `$HOSTNAME` | Your machine's hostname. |
| `$LANG` | Your language and locale configuration. |
| `$TERM` | Terminal type information. |

Check individual variables:

```bash
echo $HOME
echo $USER
echo $SHELL
echo $PATH
echo $PWD
```

### C. What is PATH?

`PATH` is one of the most important environment variables.

It contains directories where Bash searches for executable programs when you enter a command without specifying its full path.

For example:

```bash
echo $PATH
```

Possible output:

```text
/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin
```

Suppose you execute:

```bash
python3
```

Bash searches the directories listed in `PATH` until it finds an executable called `python3`.

To identify where an executable is located:

```bash
which python3
```

Or:

```bash
command -v python3
```

### D. Creating environment variables

You can create variables:

```bash
NAME="blackCoder"
```

Display the value:

```bash
echo $NAME
```

Output:

```text
blackCoder
```

However, this variable is not automatically available to child processes.

To export it:

```bash
export NAME="blackCoder"
```

Now child processes can access it.

### E. Bash configuration files

Bash uses configuration files to customize its behavior.

Important files:

| File | Purpose |
|---|---|
| `~/.bashrc` | Configures interactive non-login Bash sessions. |
| `~/.bash_profile` | Configures login Bash sessions. |
| `~/.profile` | General login configuration, often used by different shells. |
| `/etc/profile` | System-wide login configuration. |
| `/etc/bash.bashrc` | System-wide interactive Bash configuration on Debian-based systems. |

For example, you can add aliases to `~/.bashrc`:

```bash
nano ~/.bashrc
```

Add:

```bash
alias ll='ls -lah'
alias update='sudo apt update'
alias cls='clear'
```

Save the file and reload:

```bash
source ~/.bashrc
```

Now you can execute:

```bash
ll
```

Instead of typing:

```bash
ls -lah
```

**Real-world application:** Developers customize their Bash environment to create shortcuts for Git, Docker, project directories, and frequently used commands.

---

## 1.4 Bash Commands

A command is an instruction that tells the operating system to perform an operation.

Bash accepts different categories of commands.

### A. Built-in commands

These commands are implemented directly inside Bash.

Examples:

```bash
cd
echo
pwd
export
alias
read
```

Check whether a command is a Bash built-in:

```bash
type cd
```

Output:

```text
cd is a shell builtin
```

### B. External commands

These are separate executable programs installed on your system.

Examples:

```bash
ls
mkdir
cp
mv
grep
find
```

Check:

```bash
type ls
```

You may see:

```text
ls is /usr/bin/ls
```

This means `ls` is an external executable.

### C. Aliases

Aliases allow you to create shortcuts for commands.

Example:

```bash
alias ll='ls -lah'
```

Now:

```bash
ll
```

Executes:

```bash
ls -lah
```

To list your aliases:

```bash
alias
```

To remove an alias:

```bash
unalias ll
```

### D. Executing commands

You can execute commands individually:

```bash
pwd
```

Or execute multiple commands on separate lines:

```bash
pwd
ls
whoami
```

You can also execute them on one line:

```bash
pwd; ls; whoami
```

The semicolon separates commands and allows the next command to execute regardless of whether the previous one succeeded.

### E. Understanding command execution

When you enter:

```bash
ls -lah
```

Bash generally performs the following operations:

1. Reads the command.
2. Processes its syntax and expansions.
3. Identifies the command.
4. Resolves the executable if necessary.
5. Executes the command or invokes the relevant built-in.
6. Displays the output.

Understanding this process becomes important when debugging scripts.

---

## 1.5 Command Syntax

Most Linux commands follow a general structure:

```bash
command [options] [arguments]
```

Let's understand each component.

### A. Command

The program or instruction you want to execute.

Example:

```bash
ls
```

### B. Options

Options modify how a command behaves.

Example:

```bash
ls -l
```

The `-l` option tells `ls` to display information in long format.

### C. Arguments

Arguments specify the target or data on which the command should operate.

Example:

```bash
ls /home
```

Here:

- `ls` is the command.
- `/home` is the argument.

### D. Combining options

You can combine multiple options.

Example:

```bash
ls -l -a -h
```

Or:

```bash
ls -lah
```

Both request:

- `-l`: Long listing format.
- `-a`: Include hidden files.
- `-h`: Human-readable file sizes.

### E. Long options

Some commands support descriptive options beginning with two hyphens.

Example:

```bash
ls --all
```

Equivalent to:

```bash
ls -a
```

Another example:

```bash
mkdir --parents projects/backend/api
```

Equivalent to:

```bash
mkdir -p projects/backend/api
```

### F. Command arguments and spaces

Suppose you want to create a directory called:

```text
My Projects
```

This will not work as intended:

```bash
mkdir My Projects
```

Bash interprets `My` and `Projects` as separate arguments.

Use quotation marks:

```bash
mkdir "My Projects"
```

Or escape the space:

```bash
mkdir My\ Projects
```

### G. Understanding command syntax using examples

Consider:

```bash
cp -r projects /home/user/backups/
```

Breakdown:

| Component | Value | Meaning |
|---|---|---|
| Command | `cp` | Copy operation |
| Option | `-r` | Copy recursively |
| Argument 1 | `projects` | Source directory |
| Argument 2 | `/home/user/backups/` | Destination |

This structure is fundamental to understanding Linux commands.

---

## 1.6 Getting Help

Professional Linux users do not memorize every command and option.

They know how to find documentation.

Linux provides several ways to access command documentation.

### A. man — Manual pages

The `man` command displays detailed documentation.

Example:

```bash
man ls
```

This opens the manual for `ls`.

Other examples:

```bash
man mkdir
man cp
man grep
man chmod
```

Useful keyboard shortcuts:

| Key | Action |
|---|---|
| `Space` | Next page |
| `b` | Previous page |
| `/keyword` | Search for a keyword |
| `n` | Next search result |
| `q` | Quit |

### B. --help

Many commands provide a quick help summary.

Example:

```bash
ls --help
```

Other examples:

```bash
mkdir --help
cp --help
grep --help
```

This is useful when you only need to check available options.

### C. help

The `help` command provides documentation for Bash built-ins.

Example:

```bash
help cd
```

Other examples:

```bash
help echo
help export
help read
```

Remember:

- `man` is commonly used for commands with manual pages.
- `--help` provides quick command usage information.
- `help` documents Bash built-ins.

### D. type

Use `type` to understand what kind of command you are executing.

```bash
type ls
type cd
type echo
type python3
```

This helps distinguish between aliases, built-ins, functions, and external executables.

### E. which

Find the executable location:

```bash
which python3
```

### F. whatis

Get a short description of a command:

```bash
whatis ls
```

Example output:

```text
ls (1) - list directory contents
```

If manual databases are unavailable, you may need to install or update them.

### G. apropos

Search manual descriptions using keywords.

Example:

```bash
apropos directory
```

This returns commands whose manual descriptions relate to directories.

### H. Online documentation

Useful official resources:

- [GNU Bash Manual](https://www.gnu.org/software/bash/manual/bash.html?utm_source=chatgpt.com)
- [GNU Coreutils Manual](https://www.gnu.org/software/coreutils/manual/coreutils.html?utm_source=chatgpt.com)
- [Ubuntu Documentation](https://documentation.ubuntu.com/?utm_source=chatgpt.com)

**Professional habit:** When you encounter an unfamiliar command, inspect its documentation before using it in production.

---

# GROUP 2: LINUX FILESYSTEM NAVIGATION

**Objective:** Understand how Linux organizes files and directories, navigate the filesystem, identify files, and work with different types of paths.

Linux uses a hierarchical filesystem structure. Everything starts from a single root directory represented by `/`.

## 2.1 Filesystem Hierarchy

### What is a filesystem?

A filesystem is the structure and method an operating system uses to organize, store, retrieve, and manage data.

Linux organizes files and directories in a tree-like structure.

Unlike Windows, where you commonly see drives such as `C:` and `D:`, Linux uses a single directory hierarchy beginning at `/`.

### Understanding the Linux directory structure

Here are the most important Linux directories:

| Directory | Purpose |
|---|---|
| `/` | Root directory; the starting point of the entire filesystem. |
| `/home` | Contains regular users' personal directories. |
| `/root` | Home directory of the root administrator. |
| `/bin` | Essential user command executables. |
| `/sbin` | System administration executables. |
| `/etc` | System-wide configuration files. |
| `/var` | Variable data, including logs and caches. |
| `/tmp` | Temporary files. |
| `/usr` | User applications, libraries, and shared resources. |
| `/opt` | Optional third-party software. |
| `/dev` | Device files representing hardware and virtual devices. |
| `/proc` | Virtual filesystem exposing process and kernel information. |
| `/sys` | Virtual filesystem exposing kernel and device information. |
| `/boot` | Files required for booting Linux. |
| `/mnt` | Commonly used for temporary filesystem mounts. |
| `/media` | Commonly used for removable media mounts. |
| `/lib` | Essential shared libraries and kernel modules. |

### Visual representation

```text
/
├── bin/
├── boot/
├── dev/
├── etc/
├── home/
│   ├── user/
│   │   ├── Documents/
│   │   ├── Downloads/
│   │   ├── Pictures/
│   │   └── Projects/
│   └── another-user/
├── lib/
├── media/
├── mnt/
├── opt/
├── proc/
├── root/
├── run/
├── sbin/
├── sys/
├── tmp/
├── usr/
└── var/
```

Some modern Linux distributions use symbolic links to merge directories such as `/bin` into `/usr/bin`. Therefore, your actual filesystem may differ slightly.

### Practical demonstration

Execute:

```bash
ls /
```

This displays the directories and files directly under the root directory.

To inspect your home directory:

```bash
ls /home
```

To inspect system configuration files:

```bash
ls /etc
```

To inspect system logs:

```bash
ls /var/log
```

### Understanding important directories through real-world applications

Suppose you deploy Simamia's backend to a Linux VPS.

You might organize the application like this:

```text
/opt/
└── simamia/
    ├── backend/
    ├── frontend/
    └── deployment/

/etc/
└── simamia/
    └── application.conf

/var/
└── log/
    └── simamia/
        └── application.log
```

This separates:

- Application files.
- System configuration.
- Application logs.

This is a practical approach to Linux server organization.

---

## 2.2 Directory Navigation

Directory navigation means moving from one directory to another using terminal commands.

### Important commands

| Command | Purpose |
|---|---|
| `pwd` | Displays your current directory. |
| `cd` | Changes your current directory. |
| `cd ..` | Moves one directory backward/upward. |
| `cd ~` | Moves to your home directory. |
| `cd /` | Moves to the root directory. |
| `cd -` | Returns to the previous directory. |
| `pushd` | Changes directory while saving the previous location on a stack. |
| `popd` | Returns to a previously saved directory. |

### A. pwd — Print Working Directory

To understand where you are:

```bash
pwd
```

Example output:

```text
/home/user
```

This means your current working directory is `/home/user`.

### B. cd — Change Directory

Move into a directory:

```bash
cd Documents
```

Move into another directory:

```bash
cd Downloads
```

Move to a specific location:

```bash
cd /var/log
```

### C. cd ..

Move one level upward:

```bash
cd ..
```

Example:

Your current location:

```text
/home/user/Documents
```

After executing:

```bash
cd ..
```

You are now in:

```text
/home/user
```

### D. cd ~

Move directly to your home directory:

```bash
cd ~
```

You can also execute:

```bash
cd
```

Both normally take you to your home directory.

### E. cd /

Move to the root directory:

```bash
cd /
```

Check your location:

```bash
pwd
```

Output:

```text
/
```

### F. cd -

Switch between your current and previous directories:

```bash
cd /home/user/Documents
cd /var/log
cd -
```

The last command takes you back to `/home/user/Documents`.

### G. pushd and popd

These commands are useful when working across multiple directories.

Example:

```bash
cd ~
pushd /var/log
```

You have moved to `/var/log`, while your previous location is saved.

Return to the previous directory:

```bash
popd
```

### Practical demonstration

Execute these commands one by one:

```bash
pwd
cd /
pwd
cd /home
pwd
cd ~
pwd
cd /var/log
pwd
cd -
pwd
```

Observe how your location changes.

**Real-world application:** When administering a server, you may frequently switch between `/var/log`, `/etc`, `/opt`, and application directories. Efficient navigation saves time.

---

## 2.3 File Listing

File listing means displaying the contents of a directory.

The primary command is:

```bash
ls
```

### Important ls options

| Command | Purpose |
|---|---|
| `ls` | Lists files and directories. |
| `ls -l` | Displays detailed information. |
| `ls -a` | Displays hidden files. |
| `ls -h` | Uses human-readable sizes when combined with suitable formats. |
| `ls -lh` | Displays detailed information with readable sizes. |
| `ls -la` | Displays all files in detailed format. |
| `ls -R` | Lists directory contents recursively. |
| `ls -t` | Sorts by modification time. |
| `ls -S` | Sorts by file size. |
| `ls -r` | Reverses sorting order. |
| `ls -1` | Displays one entry per line. |

### A. Basic listing

```bash
ls
```

Example:

```text
Desktop  Documents  Downloads  Music  Pictures
```

### B. Detailed listing

```bash
ls -l
```

Example:

```text
drwxr-xr-x 2 user user 4096 Nov 4 10:00 Documents
-rw-r--r-- 1 user user  120 Nov 4 10:30 notes.txt
```

This displays:

- Permissions.
- Number of hard links.
- Owner.
- Group.
- Size.
- Modification date.
- Filename.

### C. Display hidden files

```bash
ls -a
```

Hidden files include:

```text
.bashrc
.profile
.gitconfig
.ssh
```

### D. Display human-readable file sizes

```bash
ls -lh
```

Instead of displaying file sizes in raw bytes, you may see:

```text
4.0K
2.5M
1.2G
```

### E. List files recursively

```bash
ls -R
```

This displays files inside the current directory and its subdirectories.

### F. Sort by modification time

```bash
ls -lt
```

This displays recently modified files first.

### G. Sort by file size

```bash
ls -lS
```

This displays larger files first.

### H. List a specific directory

You do not need to navigate into a directory to inspect it.

Example:

```bash
ls /var/log
```

Or:

```bash
ls -lah /home/user/Documents
```

### I. Combine options

One of the most useful combinations:

```bash
ls -lah
```

This displays:

- All files, including hidden files.
- Detailed file information.
- Human-readable sizes.

**Professional tip:** When investigating a Linux server, `ls -lah` is one of the commands you will frequently use.

---

## 2.4 File Identification

Linux does not depend on file extensions to identify file types.

For example, Windows commonly identifies a file using its extension:

```text
image.jpg
document.pdf
application.exe
```

Linux can inspect the actual contents of a file to determine its type.

### Important commands

| Command | Purpose |
|---|---|
| `file` | Identifies a file's actual type. |
| `stat` | Displays detailed file information. |
| `ls -l` | Displays file attributes and permissions. |
| `readlink` | Displays symbolic link targets. |
| `du` | Displays file and directory disk usage. |
| `df` | Displays filesystem disk space usage. |

### A. file

Example:

```bash
file image.jpg
```

Possible output:

```text
image.jpg: JPEG image data
```

Another example:

```bash
file application.log
```

Possible output:

```text
application.log: ASCII text
```

### B. Identifying multiple files

```bash
file *
```

This identifies files and directories in your current location.

### C. stat

```bash
stat application.log
```

Displays:

- File type.
- Size.
- Permissions.
- Ownership.
- Inode.
- Timestamps.

### D. readlink

A symbolic link is a reference pointing to another file or directory.

Example:

```bash
readlink /usr/bin/python3
```

This displays the target of the symbolic link when the path is a symbolic link.

To resolve the complete path:

```bash
readlink -f /usr/bin/python3
```

### E. du — Disk Usage

Check the size of a directory:

```bash
du -sh Documents/
```

Possible output:

```text
450M    Documents/
```

Check sizes of subdirectories:

```bash
du -h --max-depth=1 .
```

### F. df — Disk Free

Check available disk space:

```bash
df -h
```

Possible output:

```text
Filesystem      Size  Used  Avail  Use%
/dev/sda2        80G   35G    41G   47%
```

Actual output depends on your storage configuration.

### Real-world application

Suppose your VPS is running out of storage.

You can investigate:

```bash
df -h
```

Then:

```bash
du -sh /var/log
```

And:

```bash
du -sh /opt/*
```

This helps identify where disk space is being consumed.

---

## 2.5 Absolute and Relative Paths

A path tells Linux where a file or directory is located.

There are two major types of paths:

1. Absolute paths.
2. Relative paths.

Understanding this distinction is essential when working with Bash scripts.

### A. Absolute Paths

An absolute path starts from the root directory `/`.

Example:

```text
/home/user/Documents/notes.txt
```

This path identifies the file regardless of your current working directory.

You can access it from anywhere:

```bash
cat /home/user/Documents/notes.txt
```

Other examples:

```text
/etc/hostname
/var/log/syslog
/home/user/Downloads
/usr/bin/python3
```

### B. Relative Paths

A relative path is interpreted based on your current working directory.

Suppose your current location is:

```text
/home/user/
```

And you have:

```text
/home/user/Documents/notes.txt
```

You can access the file using:

```bash
cat Documents/notes.txt
```

You do not need to provide the entire path.

### C. Understanding special path symbols

Linux provides special symbols for navigating directories.

| Symbol | Meaning |
|---|---|
| `/` | Root directory. |
| `.` | Current directory. |
| `..` | Parent directory. |
| `~` | Current user's home directory. |
| `-` | Previous working directory when used with `cd`. |

### D. Practical examples

Suppose your directory structure looks like this:

```text
/home/user/
└── projects/
    └── simamia/
        ├── backend/
        │   └── app.js
        └── frontend/
            └── index.html
```

If your current location is:

```text
/home/user/projects/simamia/
```

Access the backend file:

```bash
cat backend/app.js
```

Access the frontend file:

```bash
cat frontend/index.html
```

Move into the backend directory:

```bash
cd backend
```

Return to the parent directory:

```bash
cd ..
```

Access the frontend file from the backend directory:

```bash
cat ../frontend/index.html
```

### E. Absolute vs Relative comparison

| Feature | Absolute Path | Relative Path |
|---|---|---|
| Starting point | Root `/` | Current directory |
| Depends on current location | No | Yes |
| Example | `/home/user/file.txt` | `file.txt` |
| Useful for | System configuration and fixed locations | Project navigation and scripts |

### Important Bash scripting lesson

Consider this command inside a script:

```bash
cat config.txt
```

It assumes that `config.txt` exists in the current working directory.

If you execute the script from another directory, it might fail.

A more reliable approach is to reference the script's own location:

```bash
SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
cat "$SCRIPT_DIR/config.txt"
```

This is a common technique in professional Bash scripting.

---

## 2.6 Hidden Files

Linux allows files and directories to be hidden from normal directory listings.

A filename beginning with a dot (`.`) is treated as hidden by conventional Linux tools.

Examples:

```text
.bashrc
.profile
.gitignore
.env
.ssh
.config
```

### A. Creating hidden files

```bash
touch .env
```

Create a hidden directory:

```bash
mkdir .config
```

### B. Listing hidden files

Normal listing:

```bash
ls
```

Hidden files will generally not appear.

Display all files:

```bash
ls -a
```

Display hidden files with details:

```bash
ls -lah
```

### C. Accessing hidden files

Hidden files can be accessed normally.

Example:

```bash
cat .bashrc
```

Edit a hidden configuration file:

```bash
nano .env
```

### D. Searching for hidden files

Find hidden files:

```bash
find . -type f -name ".*"
```

Find hidden directories:

```bash
find . -type d -name ".*"
```

### E. Understanding common hidden files

| File | Purpose |
|---|---|
| `.bashrc` | Bash interactive shell configuration. |
| `.profile` | User login configuration. |
| `.gitignore` | Specifies files Git should ignore. |
| `.env` | Commonly stores application environment configuration. |
| `.ssh` | Stores SSH configuration and keys. |
| `.config` | Stores application configuration directories. |
| `.npmrc` | npm configuration. |
| `.gitconfig` | Git user and configuration settings. |

### F. Important security consideration

Consider a Node.js application with:

```text
.env
```

The file might contain:

```env
DATABASE_URL=postgresql://...
JWT_SECRET=...
API_KEY=...
```

These values can provide access to sensitive systems.

A hidden filename does not make a file secure.

For Git projects, add sensitive files to `.gitignore`:

```bash
echo ".env" >> .gitignore
```

Never commit production credentials or private API keys to a public repository.

---

---

# PRACTICAL LAB: EXPLORE YOUR LINUX SYSTEM

Now let's combine Group 1 and Group 2.

You will inspect your Linux environment, identify Bash, explore the filesystem, and practice navigation.

### Step 1: Identify your shell

```bash
echo $SHELL
```

```bash
ps -p $$ -o comm=
```

```bash
bash --version
```

These commands identify your configured shell, current shell process, and Bash version.

### Step 2: Inspect your environment

```bash
whoami
```

```bash
hostname
```

```bash
pwd
```

```bash
echo $HOME
```

```bash
echo $PATH
```

### Step 3: Explore the Linux filesystem

```bash
cd /
ls -lah
```

Inspect some important directories:

```bash
ls /home
ls /etc
ls /var
ls /usr
```

### Step 4: Practice directory navigation

```bash
cd ~
pwd

cd Documents
pwd

cd ..
pwd

cd /var/log
pwd

cd -
pwd
```

If your home directory doesn't contain `Documents`, use an existing directory.

### Step 5: Explore hidden files

```bash
cd ~
ls
ls -a
ls -lah
```

Inspect your Bash configuration:

```bash
cat .bashrc
```

### Step 6: Understand command locations

```bash
type cd
type ls
type echo
type python3
```

Then:

```bash
which bash
which python3
which git
```

### Step 7: Inspect disk usage

```bash
df -h
```

```bash
du -sh ~
```

### Step 8: Practice Bash aliases

Create an alias:

```bash
alias ll='ls -lah'
```

Execute:

```bash
ll
```

Remove it:

```bash
unalias ll
```

---

# PRACTICAL EXERCISES

Complete these without looking at the notes.

### Group 1: Bash Fundamentals

| No. | Exercise | Expected result |
|---|---|---|
| 1 | Display your Bash version. | Bash version appears. |
| 2 | Identify your current username. | Username appears. |
| 3 | Display your home directory. | Home directory path appears. |
| 4 | Display your current shell. | Shell information appears. |
| 5 | Display your PATH variable. | Executable search paths appear. |
| 6 | Determine whether `cd` is a built-in command. | Command type appears. |
| 7 | Determine where `python3` is installed. | Executable location appears. |
| 8 | Create an alias called `ll`. | Alias works. |
| 9 | Display the manual for `mkdir`. | Manual opens. |
| 10 | Find documentation for commands related to directories. | Relevant commands appear. |

### Group 2: Linux Filesystem Navigation

| No. | Exercise | Expected result |
|---|---|---|
| 1 | Display the root directory contents. | Root directories appear. |
| 2 | Navigate to your home directory. | Correct location. |
| 3 | Navigate to `/etc`. | Correct location. |
| 4 | Return to your previous directory. | Previous location restored. |
| 5 | List files with detailed information. | Metadata appears. |
| 6 | Display hidden files. | Hidden files appear. |
| 7 | Identify the type of `/etc/passwd`. | File type appears. |
| 8 | Check your available disk space. | Disk usage appears. |
| 9 | Find all `.conf` files inside `/etc`. | Matching files appear. |
| 10 | Explain the difference between absolute and relative paths using examples. | Correct explanation. |

---

# KNOWLEDGE CHECK

These questions test whether you understand the underlying concepts rather than simply memorizing commands.

### Group 1

1. What is Bash, and why is it important in Linux?
2. What is the difference between Bash and the Linux kernel?
3. What is the difference between a shell and a terminal?
4. What happens when you execute `ls` in Bash?
5. What is an environment variable?
6. What is the purpose of the `$PATH` variable?
7. What is the difference between a Bash built-in and an external command?
8. Explain the difference between a command, option, and argument.
9. What is the difference between `help cd` and `man ls`?
10. What is the purpose of `.bashrc`?

### Group 2

1. What is the Linux root directory?
2. What is the difference between `/root` and `/home`?
3. Where are Linux system configuration files stored?
4. Where are Linux system logs commonly stored?
5. What is the difference between `pwd` and `ls`?
6. What does `cd ..` do?
7. What is the difference between `ls -a` and `ls -l`?
8. Why doesn't Linux require file extensions to identify file types?
9. What is the difference between absolute and relative paths?
10. Why are `.env` files hidden, and why is hiding them not sufficient security?

---

# YOUR LEARNING PROGRESSION

You have now covered four foundational groups.

| Group | Subject | Main competency |
|---|---|---|
| 1 | Bash Fundamentals | Understanding Bash and command execution. |
| 2 | Filesystem Navigation | Navigating and understanding Linux directories. |
| 3 | File & Directory Management | Managing files, directories, and metadata. |
| 4 | File Content Management | Reading, searching, processing, and comparing data. |

### What comes next?

**GROUP 5: Bash Operators and Command Composition**

This is where Bash becomes significantly more powerful.

You will learn how to combine commands, redirect data, construct pipelines, control execution, and automate operations using command composition.

One important recommendation: Since your longer-term direction includes Linux administration, cloud engineering, and DevOps, practice these commands directly on your Linux machine rather than only reading them.

**Your target:** Be comfortable navigating Linux and managing files without depending on a graphical file manager.