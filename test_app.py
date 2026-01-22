import streamlit as st

st.set_page_config(page_title="Test PAC", layout="wide")

st.title("✅ Test de Conexión Exitoso")
st.success("Si ves este mensaje, la aplicación está funcionando correctamente.")

st.write("Streamlit version:", st.__version__)

if st.button("Click aquí"):
    st.balloons()
    st.write("¡Funciona perfectamente!")
