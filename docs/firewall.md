# 🔥 Configuración de Firewall para Red Doméstica Segura
Esta guía describe cómo implementar reglas de firewall efectivas para proteger tu red local.

---

## 🛠️ Herramientas recomendadas
- **UFW (Uncomplicated Firewall)** → para sistemas Linux  
- **pfSense / OPNsense** → para un firewall dedicado  
- **Firewalla / Raspberry Pi Firewall** → soluciones ligeras para usuarios domésticos  

---

## 📝 Reglas esenciales para UFW (Linux)
```bash
# Bloquea todo por defecto
ufw default deny incoming
ufw default allow outgoing

# Permitir acceso SSH seguro
ufw allow from 192.168.1.0/24 to any port 22 proto tcp

# Permitir DNS y HTTP
ufw allow 53
ufw allow 80
ufw allow 443

# Bloquear puertos vulnerables
ufw deny 23    # Telnet
ufw deny 445   # SMB
ufw deny 135   # DCE/RPC

# Activar el firewall
ufw enable
```
---

## 👍 Buenas prácticas
- **Segmenta tu red**: separa IoT, invitados y dispositivos críticos en VLANs distintas.  
- **GeoIP blocking**: si usas OPNsense, bloquea tráfico de regiones donde no corras riesgos.  
- **Anti-spoofing**: filtra paquetes falsificados que simulan ser internos.  
- **Catch-all deny**: cualquier tráfico no definido explícitamente debe ser bloqueado.  

---

## 🚀 Recomendaciones avanzadas
- Usa **WireGuard** para acceso remoto seguro (ver guía `/etc/wireguard/`).  
- Integra **Pi-hole** como DNS para bloquear rastreadores.  
- Monitorea logs del firewall regularmente (`/var/log/ufw.log` o interfaz web).  

---

## 📚 Recursos adicionales
- [Guía oficial de UFW](https://help.ubuntu.com/community/UFW)  
- [OPNsense Firewall Best Practices](https://docs.opnsense.org/manual/firewall.html)  
- [XDA: 5 reglas que mejoran tu red doméstica](https://www.xda-developers.com/)  
