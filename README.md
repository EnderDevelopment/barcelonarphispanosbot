# Discord Bot de Roleplay: BarcelonaRPHispanosBot

BarcelonaRPHispanosBot es un Discord bot de roleplay en español creado con Discord.js v14, MySQL y comandos slash para gestionar verificación, tickets privados, moderación, identidad ciudadana, economía en euros, trabajos, inventario, tienda, licencias, funciones policiales y mensajes narrativos para Barcelona RP Hispano.

## Install

1. Instala Node.js 18.17.0 o superior y MySQL.

2. Instala las dependencias:

```bash
npm install
```

3. Crea la base de datos y sus tablas:

```bash
mysql -u root -p < schema.sql
```

4. Copia `.env.example` a `.env`:

```bash
cp .env.example .env
```

5. Configura en `.env` el token del bot, el ID de la aplicación, el ID del servidor y las credenciales de MySQL. También puedes dejar vacíos los IDs opcionales y utilizar `/configurar` dentro del servidor.

6. Invita el bot con los permisos necesarios para gestionar comandos slash, miembros, roles, canales, mensajes, moderación y bans.

7. Inicia el bot:

```bash
npm start
```

Durante el inicio, el bot registra los comandos slash en el servidor configurado y comprueba la conexión con MySQL.

## Use

1. Cuando entra un miembro nuevo, el bot crea su registro en la base de datos, asigna el rol `Sin Verificar` si está configurado y registra la entrada en el canal de logs.

2. Configura los roles y canales principales:

```text
/configurar
```

Debes indicar el rol `Sin Verificar`, el rol `Ciudadano` y el canal de logs. También puedes indicar el rol de Policía y la categoría de tickets.

3. Publica el panel de verificación:

```text
/setup-verificacion
```

El botón verde retira `Sin Verificar` y asigna `Ciudadano`.

4. Publica el panel de tickets:

```text
/setup-tickets
```

El menú permite seleccionar soporte, reportes, facciones o bandas. El bot crea un canal privado dentro de la categoría configurada.

5. Gestiona la identidad ciudadana:

```text
/crear-dni nombre apellido nacimiento nacionalidad
/dni
/dni usuario
/licencias
```

La fecha de nacimiento debe usar el formato `YYYY-MM-DD`. El DNI incluye nombre, apellido, fecha de nacimiento, nacionalidad e ID ciudadano.

6. Usa la economía y los trabajos:

```text
/saldo
/trabajar
/robar
```

Cada jugador nuevo empieza con el saldo definido en `STARTING_BALANCE`. Trabajar tiene un tiempo de espera de 30 minutos y entrega una cantidad aleatoria entre `WORK_MIN_EUROS` y `WORK_MAX_EUROS`. Robar tiene el tiempo de espera definido en `ROBBERY_COOLDOWN_MINUTES`, puede fallar y registra la actividad en los logs.

7. Consulta la tienda y el inventario:

```text
/tienda
/comprar articulo cantidad
/inventario
```

La tienda incluye botiquines, comida y teléfonos. Las compras se descuentan del dinero disponible y se guardan en MySQL.

8. Ejecuta funciones policiales:

```text
/multar usuario cantidad motivo
/arrestar usuario minutos motivo
/dar-licencia usuario tipo
```

Las licencias disponibles son conducir y armas. Las multas y arrestos se registran en la base de datos y en los logs.

9. Usa las herramientas de moderación:

```text
/ban
/unban
/kick
/silenciar
/desilenciar
```

También está disponible `/anuncio` para publicar un anuncio en un embed.

10. Publica mensajes narrativos:

```text
/me texto
/do texto
/susurro texto
```

Los embeds usan los colores rojo `#AA151B` y amarillo `#F1BF00`, y los importes se muestran en euros.

---

More Discord bot projects by EnderDevelopment: https://github.com/EnderDevelopment

Project page: https://dash.enderdevelopment.com/community/e9443dad-7fa2-4e06-95c8-dc82aa212630?utm_source=github&utm_medium=readme&utm_campaign=auto_publish&utm_content=e9443dad-7fa2-4e06-95c8-dc82aa212630
