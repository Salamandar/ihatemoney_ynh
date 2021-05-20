* Is LDAP and HTTP authentication supported ? **No**

The logins are per-project (not per-user) so it's not integrable in the Yunohost login system.

The app can be public or not. The behaviour is either:

- **non-public app**:
  - yunohost login required
  - per-project identifiers required
  - any yunohost user with access to the app can create a new project.
- **public app** :
  - no yunohost login required
  - per-project identifiers required
  - any visitor can create a new project.
