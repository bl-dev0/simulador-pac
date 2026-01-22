# 🚀 Guía Rápida de Deployment - Simulador PAC

## ⚡ Deployment en 5 minutos

### 1️⃣ Preparar archivos

Ya tienes todos los archivos necesarios:
- ✅ `simulador_pac.py` - Aplicación principal
- ✅ `requirements.txt` - Dependencias
- ✅ `README.md` - Documentación
- ✅ `.gitignore` - Archivos a ignorar
- ✅ `generar_password.py` - Herramienta de seguridad

### 2️⃣ Subir a GitHub

```bash
# En tu terminal, navega a la carpeta con los archivos
cd /ruta/a/tus/archivos

# Inicializar Git
git init
git add .
git commit -m "Simulador PAC con autenticación"

# Ir a github.com y crear nuevo repositorio "simulador-pac"
# No añadas README, .gitignore ni licencia (ya los tienes)

# Conectar y subir
git remote add origin https://github.com/TU_USUARIO/simulador-pac.git
git branch -M main
git push -u origin main
```

### 3️⃣ Deploy en Streamlit Cloud

1. Ve a: **https://share.streamlit.io**
2. Click "Sign in with GitHub"
3. Click "New app"
4. Rellena:
   ```
   Repository: TU_USUARIO/simulador-pac
   Branch: main
   Main file path: simulador_pac.py
   ```
5. Click "Deploy"

⏱️ **Tiempo de deployment**: 2-3 minutos

### 4️⃣ Configurar seguridad

Una vez desplegado:

```bash
# Generar nueva contraseña
python generar_password.py

# Introduce tu contraseña (ejemplo: "PAC_Team_2025!")
# Copia el hash generado
```

Edita `simulador_pac.py` en GitHub:
1. Encuentra línea 23: `correct_password_hash = "..."`
2. Reemplaza con tu nuevo hash
3. Commit changes

Streamlit Cloud auto-redeploya en ~30 segundos.

### 5️⃣ Compartir acceso

Tu simulador está en:
```
https://TU_USUARIO-simulador-pac.streamlit.app
```

Comparte:
- 🔗 **URL**: Con tu equipo
- 🔐 **Contraseña**: Solo por canal seguro (email, Slack DM)

---

## 🔒 Notas de Seguridad

### ⚠️ Nivel de seguridad actual
- ✅ Protección básica con contraseña
- ✅ Hash SHA-256 (no texto plano)
- ❌ Una sola contraseña compartida
- ❌ No hay logs de acceso
- ❌ No hay expiración de sesiones

### 🚀 Para mayor seguridad

Si necesitas:
- Múltiples usuarios con diferentes credenciales
- SSO con Google/Microsoft
- Logs de auditoría
- Control de acceso granular

Considera:
- **Streamlit Teams**: $250/mes - SSO empresarial
- **Hugging Face Spaces**: Gratis - Repositorios privados
- **Azure/AWS**: Deploy privado con autenticación robusta

---

## 🆘 Troubleshooting

### Error: "App is down"
- Verifica que `requirements.txt` esté en el repo
- Revisa logs en Streamlit Cloud

### Error: "Module not found"
- Asegúrate de que todas las dependencias estén en `requirements.txt`
- Redeploy la aplicación

### No puedo acceder con la contraseña
- Verifica que el hash sea correcto
- Confirma que no hay espacios extra al copiar/pegar
- Regenera el hash con `generar_password.py`

### ¿Cómo ver quién accede?
- El plan gratuito no incluye analytics
- Considera Google Analytics si necesitas tracking

---

## 📞 Soporte

Para dudas sobre el simulador:
- 📧 Email: [tu-email@ejemplo.com]
- 💬 Slack: #simulador-pac

Para dudas sobre Streamlit Cloud:
- 📚 Docs: https://docs.streamlit.io/streamlit-community-cloud
- 💬 Forum: https://discuss.streamlit.io
