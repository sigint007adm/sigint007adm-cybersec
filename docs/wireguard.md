# 🛡️ Configuración de VPN con WireGuard
WireGuard es una VPN moderna, rápida y extremadamente segura. Esta guía te muestra cómo configurarla en tu red doméstica.

---

## 📦 Requisitos
- Servidor Linux (puede ser Raspberry Pi, VPC, o PC dedicado)  
- Cliente móvil (Android, iOS) o portátil (Windows/Linux/Mac)  
- Acceso root y terminal en el servidor  
- Paquete `wireguard` instalado (`apt install wireguard`)  

---

## 🔑 Paso 1: Instalación en el servidor
```bash
sudo apt update
sudo apt install wireguard
```

---

## 🛠️ Paso 2: Generar claves
```bash
umask 077
wg genkey | tee privatekey | wg pubkey > publickey
```
Guarda `privatekey` y `publickey` en `/etc/wireguard/`.  

---

## ⚙️ Paso 3: Configurar el servidor (`wg0.conf`)
```ini
[Interface]
Address = 10.6.0.1/24
ListenPort = 51820
PrivateKey = <clave privada del servidor>

[Peer]
PublicKey = <clave pública del cliente>
AllowedIPs = 10.6.0.2/32
```

---

## 💻 Paso 4: Configurar el cliente (móvil o portátil)
```ini
[Interface]
Address = 10.6.0.2/32
PrivateKey = <clave privada del cliente>

[Peer]
PublicKey = <clave pública del servidor>
Endpoint = <IP_pública_del_servidor>:51820
AllowedIPs = 0.0.0.0/0, ::/0
```

---

## ▶️ Paso 5: Activar la VPN
```bash
sudo wg-quick up wg0
```

---

## 👍 Buenas prácticas
- Usa claves de 256 bits (generadas con `wg genkey`)  
- Configura NAT en el firewall para redireccionar el puerto 51820  
- Revisa el log con `sudo wg show` o `sudo journalctl -u wg-quick@wg0`  

---

## 📚 Recursos adicionales
- [WireGuard Quick Start](https://www.wireguard.com/quickstart/)  
- [Clientes oficiales en App Store y Google Play](https://www.wireguard.com/install/)  
- [Guía paso a paso en DigitalOcean](https://www.digitalocean.com/community/tutorials/how-to-set-up-wireguard-on-ubuntu-20-04)  
