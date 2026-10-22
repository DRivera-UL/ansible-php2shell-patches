php2shell-fix
=========

Ansible playbook that detects and corrects PHP2Shell exploit found in CVE-2026-109618 and CVE-2026-109619. Playbook offers upgrade paths and PHP backport fixes where PHP upgrades are not possible.

Requirements
------------

Ansible common and an internet connection.

Role Variables
--------------

**patch_type:**

`upgrade` (This will upgrade PHP on the system not vulerable to the PHP2Shell exploit. (Recommended)
`backport` (This will attempt to mitigate the issues present in EOL versions of PHP as far back as 5.6. (Not recommended but better than inaction)
`detect` (The "lazy" variable to detect the PHP version and attempt a best effort fix.

# Options include: 8.2, 8.3, 8.4, 8.5, latests
# Only comes in to effect if `patch_type:` is set to `upgrade`
**upgrade_version:**

`8.2` (Pins version to a secure version of PHP >=8.2.35)
`8.3` (Pins version to a secure version of PHP >=8.3.36)
`8.4` (Pins version to a secure version of PHP >=8.4.27)
`8.5` (Pins version to a secure version of PHP >=8.5.12)
`latest` (Will upgrade to the latest available PHP version

backport_type:

`patch` (Rebuilds the legacy PHP versions from the source binary and attempts a best effort to secure **known** threat vectors for the exploit.
`harden` (Disables the threat vector present in PHP2Shell but disables PHP upload.


Dependencies
------------

Ansible role refrences https://github.com/Anton-Barinov/php2shell-patches/tree/main for backport patches.

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: webservers
      roles: php2shell-fix

License
-------

GPL 3.0

Author Information
------------------

Dante Rivera
https://github.com/DRivera-UL
