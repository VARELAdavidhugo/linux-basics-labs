# Cours Palier 3 — Stockage & Filesystems

## Concepts
Disque (/dev/sdb) → Partition (/dev/sdb1) → Filesystem (EXT4) → Montage (/mnt/data) → Persistance (/etc/fstab)

## Outils
lsblk, fdisk/sfdisk, mkfs.ext4, mount/umount, /etc/fstab

## Procédure détaillée
1) Ajouter un disque (VirtualBox 10 Go) → redémarrer.
2) Vérifier: `lsblk` (voir /dev/sdb).
3) Partitionner: `sudo fdisk /dev/sdb` (n, p, 1, Entrée, Entrée, w) ou script fourni.
4) Formater: `sudo mkfs.ext4 -F /dev/sdb1`.
5) Monter: `sudo mkdir -p /mnt/data && sudo mount /dev/sdb1 /mnt/data`.
6) Persistance: ajouter à `/etc/fstab` (de préférence via UUID).
7) `sudo mount -a` puis test I/O et reboot.

## Bonnes pratiques
- Utiliser l'UUID dans fstab (`blkid /dev/sdb1`).
- Ne jamais toucher /dev/sda (disque système).
- Points de montage explicites: /mnt/data, /mnt/backup…

## Dépannage
- `mount -a` échoue → revoir la ligne fstab.
- Le nom du disque change (/dev/sdc) → utiliser UUID.
- Unmount impossible (busy) → `lsof +f -- /mnt/data` ou `fuser -vm /mnt/data`.
