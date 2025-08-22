# Lab Setup

## 🎯 Objectif
Préparer un environnement Linux pour pratiquer les commandes et labs DevOps.

## 1. Installation VM
- VirtualBox ou Proxmox
- ISO Ubuntu Server ou Debian minimal
- Configuration : 2 CPU, 2 Go RAM, 20 Go disque

## 2. Utilisateur
- Créer un utilisateur non-root
- Activer sudo : `sudo usermod -aG sudo <user>`

## 3. Outils nécessaires
- `git`, `nano`, `vim`, `htop`, `curl`, `wget`
- `openssh-server` (accès SSH)
- `tar`, `gzip`, `tree`

## 4. Test
```bash
lsb_release -a   # version Linux
uname -r         # noyau
df -h            # disques
free -h          # RAM
