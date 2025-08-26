# Linux Basics Labs
Portfolio d’apprentissage Linux réalisé sur Debian/Proxmox/VirtualBox.  
Objectif : progresser pas à pas en administration systèmes et DevOps.

📂 Sommaire des labs

### S00-setup
Préparation de l’environnement : installation VM, configuration de base.

### S01-shell
Bases du shell Linux :
- navigation (`ls`, `cd`, `pwd`)
- manipulation de fichiers (`cp`, `mv`, `rm`, `mkdir`, `touch`)
- affichage et recherche (`cat`, `less`, `head`, `tail`, `grep`, `find`)
- redirections et pipes (`>`, `>>`, `|`)

### S02-backup-tar
Script Bash de sauvegarde `.tar.gz` avec :
- horodatage automatique
- exclusions via `.backupignore`
- vérification d’intégrité (`tar -tzf`)
- rétention des anciennes sauvegardes
- planification via `cron` et `systemd`
- tests automatisés (`tests/test_backup.sh`)

### S03-storage-fs
Gestion du stockage et des filesystems :
- ajout d’un disque virtuel (VirtualBox)
- partitionnement (`fdisk`, `sfdisk`)
- formatage (`mkfs.ext4`, optionnel `mkfs.xfs`)
- montage temporaire (`mount`, `umount`)
- persistance via `/etc/fstab` (UUID recommandé)
- vérification (`lsblk`, `df -h`, `blkid`)
- tests d’I/O (`./tests/test_storage.sh`)

---

🚀 Objectifs pédagogiques
- Devenir autonome en ligne de commande Linux.  
- Apprendre à écrire des scripts Bash robustes.  
- Automatiser des tâches système (sauvegarde, stockage, planification).  
- Construire un portfolio technique démontrant mes compétences.

🔧 Outils utilisés
- Linux (Debian)  
- Bash scripting  
- Git / GitHub  
- Cron & systemd (user services)  
- VirtualBox / Proxmox (environnement de test)

📄 Licence
Projet sous licence MIT.
