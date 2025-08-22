# Exercises

## Exercice 1 — Navigation & fichiers
1) Créer `~/lab1` et `~/lab1/docs`
2) Créer `~/lab1/notes.txt` et écrire dedans (avec `nano`)
3) Copier `notes.txt` vers `~/lab1/docs/todo.txt`
4) Lister `~/lab1` en format long et lisible

## Exercice 2 — Archives
1) Archiver `~/lab1` en `~/lab1.tar.gz`
2) Lister le contenu sans extraire (`tar -tzf`)
3) Extraire dans `~/restore/lab1` (`-C`)

## Exercice 3 — Recherche
1) Créer 3 fichiers avec du texte dans `~/lab1`
2) Trouver toutes les lignes contenant “error” (insensible casse)
3) Compter les occurrences trouvées

## Exercice 4 — Disques & taille
1) Afficher l’espace disque (`df -h`)
2) Lister la taille des éléments de `~` (`du -sh * | sort -h`)
3) Trouver les fichiers > 50 MiB dans `~` (`find`)

## Exercice 5 — Droits & exécution
1) Créer `hello.sh` avec `echo "Hello"`
2) Vérifier les droits (`ls -l`)
3) Rendre exécutable pour le propriétaire (`chmod u+x`)
4) Lancer `./hello.sh`

## Exercice 6 — Script de sauvegarde
1) Copier `S02-backup-tar/scripts/backup.sh` dans `~/bin` (ou l’utiliser depuis le repo)
2) Sauvegarder `~/lab1` vers `~/Backups` (horodatage)
3) Tester `DRY_RUN=true` et `RETENTION_DAYS=1`
4) Vérifier l’archive (`tar -tzf`), puis restaurer (`restore.sh`)

## Bonus — Planification
- Cron (02:15) : voir `S02-backup-tar/docs/cron.example`
- systemd (user) : `S02-backup-tar/docs/backup.service` + `backup.timer`
