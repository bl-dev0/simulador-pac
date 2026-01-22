#!/bin/bash
# Script para deployment rápido del Simulador PAC
# Uso: ./deploy.sh TU_USUARIO_GITHUB

if [ -z "$1" ]; then
    echo "❌ Error: Debes proporcionar tu usuario de GitHub"
    echo "Uso: ./deploy.sh TU_USUARIO_GITHUB"
    echo "Ejemplo: ./deploy.sh jorge-doe"
    exit 1
fi

GITHUB_USER=$1
REPO_NAME="simulador-pac"

echo "🚀 Iniciando deployment del Simulador PAC"
echo "📦 Repositorio: https://github.com/$GITHUB_USER/$REPO_NAME"
echo ""

# Verificar si ya existe un repositorio git
if [ -d ".git" ]; then
    echo "⚠️  Ya existe un repositorio Git en este directorio"
    echo "¿Deseas continuar de todos modos? (s/n)"
    read -r response
    if [ "$response" != "s" ]; then
        echo "❌ Cancelado por el usuario"
        exit 1
    fi
else
    echo "📝 Inicializando repositorio Git..."
    git init
fi

echo ""
echo "📋 Añadiendo archivos..."
git add .

echo ""
echo "💾 Creando commit..."
git commit -m "Deploy: Simulador PAC con autenticación"

echo ""
echo "🔗 Conectando con GitHub..."
git remote add origin "https://github.com/$GITHUB_USER/$REPO_NAME.git" 2>/dev/null || \
git remote set-url origin "https://github.com/$GITHUB_USER/$REPO_NAME.git"

echo ""
echo "⬆️  Subiendo a GitHub..."
git branch -M main
git push -u origin main

echo ""
echo "✅ ¡Código subido exitosamente!"
echo ""
echo "📍 Próximos pasos:"
echo "1. Ve a: https://share.streamlit.io"
echo "2. Sign in con GitHub"
echo "3. Click 'New app'"
echo "4. Configura:"
echo "   - Repository: $GITHUB_USER/$REPO_NAME"
echo "   - Branch: main"
echo "   - Main file: simulador_pac.py"
echo "5. Click 'Deploy'"
echo ""
echo "🔐 No olvides cambiar la contraseña por defecto!"
echo "   Ejecuta: python generar_password.py"
echo ""
echo "🎉 Tu app estará en: https://$GITHUB_USER-$REPO_NAME.streamlit.app"
