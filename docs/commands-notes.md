# Command Notes

## Navigation
- `pwd` — afficher le chemin courant
- `ls -lah` — lister fichiers/dossiers (détails, tailles lisibles)
- `cd ~` / `cd -` / `cd ..` — home / précédent / parent
- `tree -L 2` — arborescence (installer `tree` si besoin)

## Fichiers & dossiers
- `touch fichier.txt` — créer un fichier vide
- `mkdir -p dir/subdir` — créer dossier(s)
- `cp -a src/ dest/` — copier en conservant attributs
- `mv src dest` — déplacer/renommer
- `rm fichier` / `rm -r dossier/` — supprimer (⚠️ avec prudence)
- `file` / `stat` — infos sur un fichier

## Affichage & flux
- `cat fichier` — afficher
- `less fichier` — page par page (q pour quitter)
- `head -n 20` / `tail -n 20` — premières/dernières lignes
- `tail -f fichier.log` — suivre un log en direct
- `wc -l` — compter les lignes
- Redirections : `>` (écrase), `>>` (ajoute), `2>` (erreurs)
- Pipes : `cmd1 | cmd2` ; `tee` : voir + écrire

## Recherche
- `grep "mot" fichier` — recherche simple
- `grep -rin "erreur" .` — récursif, insensible casse, n° lignes
- `grep -E "err(or)?|warn(ing)?"` — regex étendues
- `find /etc -type f -name "*.conf"` — par nom/type
- `find . -size +100M` — par taille
- `find . -mtime -2` — modifié il y a < 2 jours

## Archives & compression
- `tar -cvf arch.tar dossier/` — créer archive
- `tar -tvf arch.tar` — lister
- `tar -xvf arch.tar` — extraire
- `tar -czvf arch.tar.gz dossier/` — gzip
- `tar -xzvf arch.tar.gz -C /chemin` — extraire ailleurs
- `--exclude` / `--exclude-from=.backupignore` — exclusions

## Disques & système
- `df -h` — espace disque
- `du -sh dossier` — taille d’un dossier
- `du -sh * | sort -h` — tailles triées
- `lsblk -f` — disques/partitions
- `free -h` — mémoire
- `top` / `htop` — processus (htop à installer)

## Droits & propriétaires
- `ls -l` — lire les permissions (rwx)
- `chmod 755 script.sh` — droits (octal)
- `chmod u+x script.sh` — droits (symbolique)
- `chown user:group fichier` — propriétaire/groupe
- `umask` — masque par défaut (ex: 022 → fichiers 644)
