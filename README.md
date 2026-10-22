# PHP2SHELL Patch (Under construction but playbook works)

#### **RCE via OOM corruption** CVE-2026-109618

out-of-memory handling can interrupt PHP while internal request data is only partially initialized. Request cleanup may then treat the invalid data as valid.

#### **RCE via stale global state** CVE-2026-109619

request-owned internal state can survive after its backing memory has been freed. A later request handled by the same worker may use that stale state before normal initialization resets it.

#### PHP Security Advisory

https://www.php.net/archive/2026.php#2026-10-21-5

## Supported Systems

- RHEL
- Rocky Linux
- Debian
- Ubuntu

## Fix Methodology Order

Options can be selected in the variable file (php-patch-procedure: update, backport, 

1. Patches to update to PHP >=8.5.12, >=8.4.27, >=8.3.36 or >=8.2.35. (Prefered)

2. Emergency patches for old PHP 5.6/7.x/8.0/8.1 (If cannot update)

*This builds the PHP application from source and applies a best effort fix*

*There is no complete mitigation. Updating to a fixed release (or applying a real patch below) is the only safe choice. Hardening alone only blocks known attack paths and buys time.*

## Instructions

`git clone ^PLACEHOLDER_REPO^`

`cd ^PLACEHOLDER_REPO^`

`ansible-vault encrypt inventory/group_vars/all/vault.yml

`vim inventory/inventory.yaml`

Add in the effected servers.

`vim inventory/group_vars/all/vars.yml`

Choose your upgrade type either being *update* or *backport*

For update you can pin a PHP major release version if you do not wish to do a latests upgrade.

You can select the following options.

- 8.2
- 8.3
- 8.4
- 8.5
- Detect (Will detect the currently installed PHP if in list)
- *null* (Will default to updating PHP to latest)

For backport you can identify if you want to fix either enahced or backport

**Enhanced:** attempts to patch the issue while leaving uploads intact (Recommeneded but less secure)
**Minimal:** disables the attack surface (Most secure but strips PHP down)


