# 🖧 Guía de instalación de Pi-hole en red doméstica
> **Pi-hole** es una herramienta que actúa como un servidor DNS local, bloqueando publicidad y rastreadores en la red.

---

## 📦 Requisitos
- Raspberry Pi (modelo 3 o superior) o equipo con Debian/Ubuntu  
- Conexión a internet  
- Acceso a terminal (SSH o local)  
- IP estática configurada  

---

## ⚡ Instalación rápida
```bash
curl -sSL https://install.pi-hole.net | bash
```

> 🔒 Recomendación: revisa el script antes de ejecutarlo si prefieres seguridad adicional.

---

## ⚙️ Configuración básica
Durante la instalación, se te pedirá:

- **Interfaz de red**: elige la que esté conectada a tu router  
- **DNS externo**: puedes usar Cloudflare (1.1.1.1) o Quad9 (9.9.9.9)  
- **Listas de bloqueo**: se incluyen por defecto, puedes añadir más luego  
- **IP estática**: asegúrate de que tu Pi tenga una IP fija  
- **Web admin**: activa el panel de control web  

---

## 🔑 Acceso al panel de administración
Una vez instalado, accede al panel desde cualquier navegador:

```
http://<IP-de-tu-pi>/admin
```

---

## 👍 Buenas prácticas
🔑 Cambia la contraseña del panel con:  
```bash
pihole -password <Tu contraseña>
```

♻️ Actualiza listas de bloqueo semanalmente:  
```bash
pihole -g
```

➕ Añade listas adicionales desde [firebog.net](https://firebog.net)  

---

## ✅ Verificación
- Usa `pihole status` para verificar que el servicio está activo  
- Revisa los logs en `/var/log/pihole.log`  
- Prueba con un dispositivo conectado: accede a una web con publicidad y verifica si se bloquea  

---

## 🌐 Integración con red doméstica
- Configura tu router para que use la IP del Pi-hole como DNS principal  
- Alternativamente, configura DNS manualmente en cada dispositivo  

---

## 📚 Recursos adicionales
- [Documentación oficial](https://docs.pi-hole.net/)  
- [Lista de comandos útiles](https://docs.pi-hole.net/core/pihole-command/)  
- [Guía avanzada con Unbound](https://docs.pi-hole.net/guides/unbound/)  
