* L'authentification LDAP et HTTP est-elle prise en charge ? **Non**

L'authentification est par projet (et non par utilisateur) donc ce n'est pas intégrable dans le système d'authentification de Yunohost.

L'application peut néanmoins être configurée en public ou non :

- **app non publique**:
  - authentification Yunohost requise
  - identifiants de projets requis
  - Tout utilisateur Yunohost avec accès à l'app peut créer un nouveau projet.
- **app publique** :
  - authentification Yunohost non requise
  - identifiants de projets requis
  - Tout visiteur peut créer un nouveau projet.
