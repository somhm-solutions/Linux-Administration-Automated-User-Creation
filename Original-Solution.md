# This s
For this assignment, you'll use a Virtual Machine to:
- Create users and groups
- Set file permissions
- Manage `sudo` rights

---
## Instructions
### Part I: Users and Groups
- In your virtual machine, create the following user accounts:
  - `Andy`
  - `Ollie`
  - `Tina`
  - `Louise`
  - `Gene`
  - `Jimmy`
  - `Teddy`
- Set their passwords to be whatever you would like.
- On the same machine, create the following groups with the following members:
  - `students`: Andy, Ollie, Gene, Jimmy, Teddy
  - `teachers`: Tina, Louise, Ollie
  - Add `Tina` and `Ollie` to the `sudo` and `adm` groups.

When you're done, run: `cut -d: -f1 /etc/passwd | xargs groups` and take a screenshot. This command will show all users, along with the groups they're in. **You'll submit this screenshot as proof of your solution.**

  > **Solutions**
  > ```bash
  >sudo apt update -y
  >sudo apt install -y sudo
  >sudo adduser andy
  >sudo adduser ollie
  >sudo adduser tina
  >sudo adduser louise
  >sudo adduser gene
  >sudo adduser jimmy
  >sudo adduser teddy
  >sudo groupadd students
  >sudo groupadd teachers
  >sudo usermod -aG students andy
  >sudo usermod -aG students ollie
  >sudo usermod -aG students gene
  >sudo usermod -aG students jimmy
  >sudo usermod -aG students teddy
  >sudo usermod -aG teachers tina
  >sudo usermod -aG teachers louise
  >sudo usermod -aG teachers ollie
  >sudo usermod -aG sudo tina
  >sudo usermod -aG adm tina
  >sudo usermod -aG sudo ollie
  >sudo usermod -aG adm ollie
  > ```

### Part II: Restricting Sudo Access
- Use `visudo` to update `/etc/sudoers` such that `Teddy` and `Louise` can _only_ run `apt` with `sudo`.

When you're done, run: `sudo -lU teddy` and `sudo -lU louise`, and take a screenshot. **You'll submit this screenshot as proof of your solution.**

  > **Solution**: Your excerpt should look like:
  > ```bash
  > User louise may run the following commands on linux:
  > louise ALL=(ALL:ALL) /usr/bin/apt
  > User teddy may run the following commands on linux:
  > teddy ALL=(ALL:ALL) /usr/bin/apt
  > ```

## Part III: Logging Sudo Access Attempts
- Check if `rsyslog` is installed. If not, install it.
- Start `rsyslog`.
  - **Note**: Use the `service` command.
- Switch users to `Louise`, and do the following:
  - Use `sudo` to run `apt update`, but enter the wrong password.
  - Use `sudo` to run `apt update`.
  - Use `sudo` to run `cat /etc/passwd`.
- Repeat the above as `Teddy`.
- Switch to the `root` user.
- Inspect `/var/log/auth.log`. Look for messages about `sudo`. Which of the commands you ran as `Teddy` and `Louise` do you see in the logs?

  > **Solution**: Your `/etc/sudoers` excerpt should look like:
  > ```bash
  > Oct  1 16:54:33 linux sudo:   louise : command not allowed ; TTY=pts/0 ; PWD=/home/instructor ; USER=root ;      COMMAND=/bin/bash
  > Oct  1 16:54:37 linux sudo:   louise : command not allowed ; TTY=pts/0 ; PWD=/home/instructor ; USER=root ; COMMAND=/bin/bash
  > Oct  1 16:54:52 linux sudo: pam_unix(sudo:auth): authentication failure; logname= uid=1008 euid=0 tty=/dev/pts/0 ruser=louise rhost=  user=louise
  > Oct  1 16:55:03 linux sudo:   louise : 3 incorrect password attempts ; TTY=pts/0 ; PWD=/ ; USER=root ; COMMAND=/usr/bin/apt update
  > Oct  1 16:55:11 linux sudo:   louise : TTY=pts/0 ; PWD=/ ; USER=root ; COMMAND=/usr/bin/apt update
  > Oct  1 16:54:33 linux sudo:   teddy : command not allowed ; TTY=pts/0 ; PWD=/home/instructor ; USER=root ;      COMMAND=/bin/bash
  > Oct  1 16:54:37 linux sudo:   teddy : command not allowed ; TTY=pts/0 ; PWD=/home/instructor ; USER=root ; COMMAND=/bin/bash
  > Oct  1 16:54:52 linux sudo: pam_unix(sudo:auth): authentication failure; logname= uid=1008 euid=0 tty=/dev/pts/0 ruser=louise rhost=  user=louise
  > Oct  1 16:55:03 linux sudo:   teddy : 3 incorrect password attempts ; TTY=pts/0 ; PWD=/ ; USER=root ; COMMAND=/usr/bin/apt update
  > Oct  1 16:55:11 linux sudo:   teddy : TTY=pts/0 ; PWD=/ ; USER=root ; COMMAND=/usr/bin/apt update
  > ```

### Part IV: Customizing User Directories
- Inside each user's `/home` directory, create the following folders:
  - `Documents`
  - `Downloads`
  - `Pictures`
  - `Videos`

- Set permissions for each user's directory to have full permissions for the associated user, read permissions for their group, and no permissions for the world.
  - For example, files in Teddy's directory should have permissions like: `rwxr-----`.

- Test your permissions by switching to one of the users, and attempting to read the other users' files. You should get `Permission denied` errors.
  - For example, switch to the user `Teddy`, and try to list files in `/home/jane`.

- Research `/etc/skel` to figure out how to avoid manually creating `Documents`, etc., directories for every user: <http://www.linfo.org/etc_skel.html>

- Update your `/etc/skel` with `Documents`, etc., directories. Then, create a new user with your name. Inspect the contents of your new user's `/home` directory to verify that your `/etc/skel` update works as expected. **Please submit both a  screenshot of your `/etc/skel` and new user's home directory as proof of your solution.**

  > **Solution**:
  > Your `/etc/skel` should look like:
  > ```bash
  > $ ls /etc/skel
  >   Documents Downloads Pictures Videos
  > ```
