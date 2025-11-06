## Docker Cleanup Script for Linux
![image](https://img.shields.io/badge/Bash-4EAA25?style=for-the-badge&logo=gnubash&logoColor=white)
![image](https://img.shields.io/badge/Shell_Script-121011?style=for-the-badge&logo=gnu-bash&logoColor=white)
![image](https://img.shields.io/badge/Linux-FCC624?style=for-the-badge&logo=linux&logoColor=black)
![Ansible Badge](https://img.shields.io/badge/Ansible-E00?logo=ansible&logoColor=fff&style=for-the-badge)

### What is this?
This is a **Docker** cleanup script for **Linux**, written in **Bash**. It deletes dead and exited `containers`, unused `images`, unused `volumes` and other `docker trash`.
### Automated installation with Ansible
1. Clone the repository:
```bash
git clone https://github.com/LaggerIsME/docker-cleanup.git
```
2. Download and install the Ansible: https://docs.ansible.com/ansible/latest/installation_guide/installation_distros.html
3. Move to the `~/docker-cleanup/ansible/` directory:
```bash
cd docker-cleanup/ansible/ 
```
4. Copy the `example.hosts` to `hosts`:
```bash
cp example.hosts hosts
```
5. Configure `variables` in `.hosts` file:
```bash
test_server_1 ansible_host="192.168.122.58" ansible_user="test" ansible_become_password="testpassword" ansible_password="testpassword"
test_server_1 ansible_host="192.168.122.59" ansible_user="test2" ansible_become_password="testpassword2" ansible_password="testpassword2"
```
6. Activate `ansible-playbook`:
* With default `hosts` file:
```bash
ansible-playbook install-script.yml -i hosts
```
* With encrypted `hosts` file: 
```bash
ansible-playbook --ask-vault-pass install-script.yml -i hosts
```

After all these actions, the **script** will clear your **Linux** every day at 01:00.



### Manual installation
1. Clone the repository:
```bash
git clone https://github.com/LaggerIsME/docker-cleanup.git
```
2. Move to the `~/docker-cleanup/` directory:
```bash
cd docker-cleanup/
```
3. Copy the `docker-cleanup.sh` to `/root`:
```bash
sudo cp docker-cleanup.sh /root/
```
4. Make the `docker-cleanup.sh` executable:
```bash
sudo chmod +x /root/docker-cleanup.sh
```
5. Enter in `root` user:
```bash
sudo -i -u root
```
5. Enter in `root`'s `crontab` with command:
```bash
crontab -e
```
6. Add `task` in `crontab` (Example: Run script every day in 01:00):
```bash
0 1 * * * /root/docker-cleanup.sh
```

After all these actions, the **script** will clear your **Linux** every day at 01:00.
