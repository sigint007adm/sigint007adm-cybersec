#!/bin/bash

# 🛡️ WireGuard Setup Script for Raspberry Pi
# Autor: Sigint & Copilot
# Uso: Ejecutar como root en Raspberry Pi OS

set -e

echo "🔧 Actualizando sistema..."
apt update && apt upgrade -y

echo "📦 Instalando WireGuard..."
apt install wireguard -y

echo "🔐 Generando claves..."
umask 077
mkdir -p /etc/wireguard/keys
wg genkey | tee /etc/wireguard/keys/server_private.key | wg pubkey > /etc/wireguard/keys/server_public.key

SERVER_PRIV=$(cat /etc/wireguard/keys/server_private.key)
SERVER_PUB=$(cat /etc/wireguard/keys/server_public.key)

echo "🧬 Creando configuración wg0.conf..."
cat <<EOF > /etc/wireguard/wg0.conf
[Interface]
Address = 10.0.0.1/24
ListenPort = 51820
PrivateKey = $SERVER_PRIV
SaveConfig = true

# 🔒 Cliente ejemplo (añadir más manualmente)
#[Peer]
#PublicKey = <clave pública del cliente>
#AllowedIPs = 10.0.0.2/32
EOF

echo "🔁 Activando reenvío de IP..."
echo "net.ipv4.ip_forward=1" >> /etc/sysctl.conf
sysctl -p

echo "🌐 Configurando NAT con iptables..."
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
apt install iptables-persistent -y
netfilter-persistent save

echo "🚀 Activando WireGuard..."
systemctl enable wg-quick@wg0
systemctl start wg-quick@wg0

echo "✅ WireGuard instalado y funcionando en Raspberry Pi"
echo "📄 Clave pública del servidor: $SERVER_PUB"
