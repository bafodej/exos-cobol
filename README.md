# COBOL - Exercices de Découverte

## 📋 Description

Ce repository contient une collection d'exercices basiques pour découvrir et apprendre le langage COBOL (Common Business-Oriented Language). Ces exercices sont conçus pour les débutants souhaitant comprendre les fondamentaux de ce langage historique encore largement utilisé dans les systèmes bancaires et administratifs.

## 🎯 Objectifs

- Comprendre la structure d'un programme COBOL
- Maîtriser les divisions principales (IDENTIFICATION, ENVIRONMENT, DATA, PROCEDURE)
- Apprendre les types de données et variables
- Pratiquer les opérations arithmétiques de base
- Découvrir la gestion des fichiers
- S'initier aux structures de contrôle (IF, PERFORM, etc.)


## 🚀 Prérequis

### Installation du compilateur COBOL

#### Linux (Ubuntu/Debian)
```bash
sudo apt update
sudo apt install open-cobol
```

#### Linux (CentOS/RHEL)
```bash
sudo yum install cobol
```

#### Windows
- Télécharger et installer [GnuCOBOL](https://sourceforge.net/projects/gnucobol/)
- Ou utiliser [OpenCobolIDE](https://github.com/OpenCobolIDE/OpenCobolIDE)

#### macOS
```bash
brew install gnu-cobol
```

## 🔧 Compilation et Exécution

### Méthode manuelle
```bash
# Compiler un programme COBOL
cobc -x -o programme programme.cob

# Exécuter le programme
./programme
```

### Avec le script utilitaire
```bash
# Rendre le script exécutable
chmod +x utils/compile.sh

# Compiler et exécuter
./utils/compile.sh exercices/01-hello-world/hello.cob
```

## 📚 Liste des Exercices

### 🟢 Niveau Débutant

#### 1. Affectation de Variables (aff.cob)
- **Objectif :** Premier contact avec les variables COBOL
- **Description :** Déclaration et affectation de données client (ID, prénom, profession, email, code postal, salaire)
- **Concepts :** PIC, WORKING-STORAGE, MOVE, DISPLAY
- **Compétences :** Structure de base d'un programme COBOL

#### 2. Affichage Date et Heure (datedj.cob)
- **Objectif :** Manipulation des fonctions de date système
- **Description :** Récupération et formatage de la date et heure courante
- **Concepts :** FUNCTION CURRENT-DATE, REDEFINES, formatage de données
- **Compétences :** Fonctions intrinsèques COBOL

#### 3. Tableaux et Structures (table.cob)
- **Objectif :** Gestion des tableaux et structures répétitives
- **Description :** Affichage de données personnelles stockées dans un tableau (ID, nom, score)
- **Concepts :** OCCURS, REDEFINES, PERFORM VARYING, tableaux indexés
- **Compétences :** Structures de données complexes

### 🟡 Niveau Intermédiaire

#### 4. Calculatrices Interactives
- **Fichiers :** calc1.cob, calc2.cob, CALCULATRICE.cob
- **Objectif :** Programmes de calcul avec interaction utilisateur
- **Description :** Trois approches différentes pour créer une calculatrice (EVALUATE, continuation de calculs, COMPUTE)
- **Concepts :** ACCEPT, EVALUATE, ADD/SUBTRACT/MULTIPLY/DIVIDE, COMPUTE, gestion erreurs
- **Compétences :** Logique conditionnelle, opérations arithmétiques, validation d'entrées

#### 5. Vérification d'Isogramme (Isogr.cob)
- **Objectif :** Algorithme de détection de lettres répétées
- **Description :** Vérification si un mot est un isogramme (aucune lettre répétée)
- **Concepts :** PERFORM VARYING imbriqués, manipulation de chaînes, LENGTH
- **Compétences :** Algorithmes de comparaison, boucles imbriquées

#### 6. Lecture de Fichiers d'Assurances (assurer.cob)
- **Objectif :** Gestion de fichiers séquentiels
- **Description :** Lecture d'un fichier d'assurances et affichage conditionnel de lignes spécifiques
- **Concepts :** FILE-CONTROL, FD, OPEN/READ/CLOSE, FILE STATUS, EVALUATE
- **Compétences :** Manipulation de fichiers, structures conditionnelles

#### 7. Gestion Multi-Fichiers (depart.cob)
- **Objectif :** Manipulation de plusieurs fichiers et COPY books
- **Description :** Lecture de fichiers départements et clients avec utilisation de COPY
- **Concepts :** Multiple FILE-CONTROL, COPY, REDEFINES, structures employés
- **Compétences :** Architecture modulaire, gestion de copies

### 🔴 Niveau Avancé

#### 8. Structure de Fichier Trains (train-fragment.cob)
- **Objectif :** Définition de structures de fichiers à taille variable
- **Description :** Fragment montrant la gestion des trains avec enregistrements variables
- **Concepts :** RECORD VARYING, DEPENDING ON, structures de transport
- **Compétences :** Fichiers à longueur variable

#### 9. Système de Gestion Académique (prog.cob + promo.cob)
- **Objectif :** Application complète avec base de données et rapports
- **Description :** 
  - **prog.cob :** Connexion SQL, création de tables, insertion de données étudiants/cours
  - **promo.cob :** Lecture de fichiers, traitement de données, génération de bulletins de notes
- **Concepts :** 
  - EXEC SQL, connexion base de données, gestion d'erreurs SQL
  - Génération de rapports, OCCURS DEPENDING ON, SEARCH, STRING
- **Compétences :** Intégration SQL-COBOL, traitement de données complexes, génération de rapports

## 📖 Ressources Supplémentaires

### Documentation
- [Syntaxe COBOL](docs/syntaxe-cobol.md) - Guide de référence rapide
- [Glossaire](docs/glossaire.md) - Terminologie COBOL essentielle

### Liens Utiles
- [Documentation GnuCOBOL](https://gnucobol.sourceforge.io/)
- [COBOL Tutorial - Tutorialspoint](https://www.tutorialspoint.com/cobol/)
- [IBM COBOL Documentation](https://www.ibm.com/docs/en/cobol-zos)

## 🎓 Comment Utiliser ce Repository

1. **Cloner le repository**
   ```bash
   git clone https://github.com/votre-username/cobol-exercices.git
   cd cobol-exercices
   ```

2. **Installer COBOL** (voir section Prérequis)

3. **Commencer par l'exercice 1**
   ```bash
   cd exercices/01-hello-world
   cat README.md  # Lire les instructions
   ```

4. **Compiler et tester**
   ```bash
   cobc -x -o hello hello.cob
   ./hello
   ```


## 📝 Structure d'un Exercice Type

Chaque dossier d'exercice contient :
- **Programme COBOL** (.cob)
- **README.md** avec :
  - Objectif de l'exercice
  - Concepts abordés
  - Instructions d'exécution
  - Résultat attendu
  - Exercices bonus (optionnel)

## 🐛 Problèmes Courants

### Erreur de compilation
```bash
# Vérifier la syntaxe
cobc -fsyntax-only programme.cob

# Compiler en mode debug
cobc -x -g -o programme programme.cob
```

### Problème d'encodage
- Utiliser l'encodage ASCII ou UTF-8
- Éviter les caractères spéciaux dans les noms


## 🙏 Remerciements

- Communauté COBOL pour les ressources
- Contributeurs au projet GnuCOBOL
- Tous les développeurs qui maintiennent ce langage vivant

---

⭐ N'hésitez pas à mettre une étoile si ce repository vous a aidé à apprendre COBOL !
