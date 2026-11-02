---
name: revisar-upstream
description: Revisar qué cambió en el repo original (asermax/claude-plugins, remoto `upstream`) desde la última revisión y traer a mano lo que valga la pena. Usar cuando el usuario diga "revisá el upstream", "qué hay nuevo en el original", "traé novedades de asermax", "sincronizá con upstream" o similar.
---

# Revisar upstream

Este repo es una copia personal de `github.com/asermax/claude-plugins`. No se hace rebase ni merge con el original: los cambios se revisan cada tanto y se traen a mano.

- Remoto `upstream`: el repo original (fetch solamente; el push está deshabilitado).
- Remoto `origin`: el repo propio (`MolinaFranco/claude-config`).
- Tag `upstream-revisado`: el último commit de upstream que ya se revisó. Todo lo anterior ya se miró y se trajo o se descartó.
- Rama de upstream: `master`.

## Pasos

1. **Traer y listar lo nuevo**

   ```bash
   git fetch upstream
   git log --oneline --reverse upstream-revisado..upstream/master
   git diff --stat upstream-revisado upstream/master
   ```

   Si no hay commits nuevos, avisar y terminar.

2. **Resumir para el usuario**, agrupado por plugin o carpeta: qué cambió y para qué sirve, en alto nivel. Ignorar el ruido:
   - commits que solo hacen bump de versiones (`chore(marketplace): bump versions`)
   - cambios en plugins que este repo no usa o sacó del `marketplace.json`
   - skills propias del autor (`sync-with-filadd`, `sync-upstream`), que dependen de rutas de su máquina

   Para cada grupo, recomendar traerlo o descartarlo, con una línea de por qué.

3. **Esperar la decisión del usuario.** No aplicar nada sin confirmación.

4. **Aplicar lo elegido**, con el método que mejor encaje:
   - Commit entero y autocontenido: `git cherry-pick <sha>`. Si hay conflictos, resolverlos preservando las personalizaciones de este repo (nombre `molina-plugins` del marketplace, owner, plugins quitados).
   - Archivo puntual: `git checkout upstream/master -- <ruta>`, después revisar el diff.
   - Cambio mezclado con cosas que no se quieren: aplicar a mano solo la parte útil.

   No traer los bumps de versión de `marketplace.json`; este repo maneja sus propias versiones.

5. **Mover la marca**, solo cuando el usuario confirme que la revisión terminó (aunque haya descartado cosas):

   ```bash
   git tag -f upstream-revisado upstream/master
   git push -f origin upstream-revisado
   ```

6. **Reportar** qué se trajo, qué se descartó y en qué commits quedó.
