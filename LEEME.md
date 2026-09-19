# hola.hebra.studio · página puntero

**3 de septiembre de 2026.** El destino del QR de las tarjetas de visita. Una página estática
servida por nginx dentro de un contenedor. Sin base de datos, sin PHP, sin panel y sin sesiones que
se puedan romper: si algún día deja de funcionar, es porque se ha caído el VPS entero.

**Por qué existe:** el papel es inmutable. Esta URL no lo es. Lo que hay detrás se cambia en un
minuto sin reimprimir nada.

---

## Qué hay dentro

```
index.html      ← la página. Aquí se editan los enlaces.
assets/
  hebra-logo.svg          la mariposa y el logotipo, en curvas
  fonts/*.woff2           Montserrat y Playfair, servidas desde aquí
nginx.conf      cabeceras y caché
Dockerfile      nginx:alpine + los ficheros. Nada más
```

**Fuentes propias a propósito.** Nada de Google Fonts: quitaste ese enlace del sitio para que la IP
del visitante no llegue a `fonts.gstatic.com`, y esta página respeta la misma promesa.

---

## Qué enlaces hay ahora — 19 de septiembre de 2026

| Enlace | Papel |
|---|---|
| **Talleres de moto** (`/talleres-de-moto`) | El principal, en cobre. Lo que contesta al que aún no es cliente tuyo |
| WhatsApp · teléfono · correo | «Y si prefieres hablar conmigo» |
| La web | `hebra.studio` |
| Verificable y privacidad | En el pie |

🔴 Los textos viven en el diccionario T de index.html, en cuatro idiomas: cambiar el HTML sin cambiar T no cambia nada en el navegador.

🔴 **LinkedIn no está, y es una decisión, no un olvido.** El dueño de una peluquería o de un taller
de motos no entra en LinkedIn; el QR de la tarjeta se lo va a escanear él, en su mostrador. LinkedIn
sigue siendo canal, pero para el comprador mediano, y no pinta nada en esta página.

🔴 **Falta un enlace a la política de privacidad, y tiene fecha.** Cuando un dueño te da su móvil en
la puerta tienes el deber de informarle (art. 13 RGPD). Con la política enlazada aquí, **entregar la
tarjeta cumple ese deber sin decir una palabra más**. Las tarjetas están encargadas. Detalle en
`03-Legal-RGPD/RGPD-08-RAT-Responsable-art30.md`, actividad 4.

---

## Cómo cambiar los enlaces

Abre `index.html` y busca el comentario que dice **EDITA AQUÍ**. Cada botón es un bloque
`<a class="enlace">`.

- **Cambiar de demo:** cambia el `href` y los dos textos (`class="t"` es el título, `class="s"` la
  línea pequeña).
- **Añadir otra:** copia un bloque entero y pégalo debajo, dentro de `<div class="grupo">`.
- **Quitarla:** borra el bloque.
- **Que un botón sea el principal** (cobre, grande): añádele `principal` a su clase. Debería haber
  **uno solo**; si hay dos, no hay ninguno.

Guarda, redespliega en Coolify y ya está. El HTML se sirve sin caché, así que el cambio se ve al
instante.

---

## Despliegue en Coolify

1. Sube esta carpeta a un repositorio Git (privado vale).
2. En Coolify: **New Resource → Git Repository**, elige el repo y **build pack: Dockerfile**.
3. **Antes de asignar el dominio, quítaselo a LinkStack.** Si `hola.hebra.studio` está declarado en
   dos recursos a la vez, el proxy no sabe a cuál mandar el tráfico y falla de forma rara. Primero se
   lo quitas al contenedor de LinkStack, luego se lo pones a este.
4. Asigna `hola.hebra.studio` a este recurso, con HTTPS.
5. Despliega y comprueba en una ventana de incógnito.

LinkStack puede quedarse levantado en otro subdominio si algún día quieres retomarlo, o apagado.
Ya no está en el camino del QR.

---

## Comprobaciones antes de dar por bueno

- Ábrela **en el móvil**, que es donde la va a ver el 95 % de la gente.
- Ponte el sistema en **modo claro** y recárgala: tiene que seguir viéndose navy. Esta página no
  obedece al modo del visitante, tiene color propio.
- Escanea el QR de verdad, con el móvil, desde la tarjeta impresa cuando la tengas.

LinkStack retirado el 12-09-2026; su configuración está en `_archivo/linkstack-2026-09/`.
