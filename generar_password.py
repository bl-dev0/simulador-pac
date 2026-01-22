#!/usr/bin/env python3
"""
Script para generar hash SHA-256 de contraseñas
Usar este script para crear una nueva contraseña para el simulador PAC
"""

import hashlib
import sys

def generate_password_hash(password):
    """Genera el hash SHA-256 de una contraseña"""
    return hashlib.sha256(password.encode()).hexdigest()

if __name__ == "__main__":
    print("=" * 60)
    print("Generador de Hash de Contraseña - Simulador PAC")
    print("=" * 60)
    print()
    
    if len(sys.argv) > 1:
        # Si se pasa como argumento
        password = sys.argv[1]
    else:
        # Si se ejecuta interactivamente
        password = input("Introduce la contraseña que deseas usar: ")
    
    hash_result = generate_password_hash(password)
    
    print()
    print("✅ Hash generado exitosamente:")
    print("-" * 60)
    print(hash_result)
    print("-" * 60)
    print()
    print("📝 Instrucciones:")
    print("1. Copia el hash de arriba")
    print("2. Abre simulador_pac.py")
    print("3. Busca la línea: correct_password_hash = \"...\"")
    print("4. Reemplaza el hash existente con el nuevo hash")
    print("5. Guarda el archivo y redeploy en Streamlit Cloud")
    print()
    print("🔐 La nueva contraseña será: " + password)
    print()
