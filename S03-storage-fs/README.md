# 🗄️ Palier 3 — Stockage & Filesystems (Projet)

## Objectif
Ajouter un disque virtuel (VirtualBox), créer une partition, formater en EXT4, monter sur `/mnt/data` et rendre le montage **persistant** via `/etc/fstab`.

## Étapes rapides
1. Ajouter un disque de 10 Go dans VirtualBox (VM éteinte).
2. Redémarrer Debian → vérifier `lsblk` (voir `/dev/sdb`).
3. Créer + formater: `sudo ./scripts/create_partition.sh /dev/sdb`
4. Monter + persister: `sudo ./scripts/mount_persistent.sh /dev/sdb1 /mnt/data`
5. Tester: `./tests/test_storage.sh /mnt/data`
6. Rebooter et vérifier que `/mnt/data` est monté automatiquement ✅

## Commandes utiles
- `lsblk`, `df -h`, `mount/umount`, `mkfs.ext4`, `/etc/fstab`
