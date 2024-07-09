# On install
## Enable git repo 
(may need dev-vcs/git if not already available)
`emerge --ask dev-vcs/git`
`eselect repository disable gentoo`
`eselect repository enable gentoo`

This should automate this `/etc/portage/repos.conf/gentoo.conf`

```
[DEFAULT]
main-repo = gentoo

[gentoo]

# The sync-depth=1 option speeds up initial pull by fetching 
# only the latest Git commit and its immediate ancestors, 
# reducing the amount of downloaded Git history.
sync-depth = 1

sync-type = git
auto-sync = yes
location = /var/db/repos/gentoo
sync-git-verify-commit-signature = yes
sync-openpgp-key-path = /usr/share/openpgp-keys/gentoo-release.asc
sync-uri = https://github.com/gentoo-mirror/gentoo.git
```

Verify 
`portageq repos_config`

Delete old
`rm -r /var/db/repos/gentoo`

Sync new
`emaint sync -r gentoo`
