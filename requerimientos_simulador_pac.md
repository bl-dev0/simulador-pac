# Requerimientos finales – Simulador de Dimensionamiento PAC

## 1. Objetivo del simulador

El simulador PAC tiene como objetivo dimensionar **mensualmente** el número de personas necesarias (FTE) para atender un servicio compuesto por varios procesos secuenciales, bajo distintos **escenarios de entrada de empresas**, asumiendo que la dotación de personal puede **ajustarse mes a mes** para absorber toda la demanda sin generación de backlog.

El simulador está orientado a:
- Planificación operativa
- Dimensionamiento de equipos
- Análisis de escenarios (agresivo, moderado, conservador)
- Soporte a decisiones de presupuesto y crecimiento

---

## 2. Horizonte temporal y granularidad

- Horizonte de simulación: **5 meses**
- Unidad temporal de cálculo: **mensual**
- Cada mes es independiente (no existe arrastre de carga entre meses)

---

## 3. Modelo de procesos

El servicio PAC consta de **5 procesos secuenciales**:

1. **Orientación** (por empresa, mediante sesiones)
2. **Inscripción** (por expediente)
3. **Asesoramiento** (por expediente)
4. **Evaluación** (por expediente)
5. **Acreditación** (por expediente)

### Consideraciones generales
- La orientación se realiza **una sola vez por empresa**.
- Tras finalizar la orientación, la empresa entrega **todos sus expedientes conjuntamente**.
- Los procesos 2 a 5 se realizan **por expediente individual**.
- No se consideran reprocesos ni retrabajos.

---

## 4. Tipologías de empresa

El modelo distingue **tres tipologías de empresa**:

- Pequeña
- Mediana
- Grande

Para cada tipología se define:
- Número de empresas que entran por mes
- Número de expedientes por empresa

### Valores predeterminados (modificables)

| Tipo     | Expedientes por empresa |
|---------|-------------------------|
| Pequeña | 50                      |
| Mediana | 100                     |
| Grande  | 500                     |

---

## 5. Modelo del proceso de Orientación

### Supuestos
- Todas las empresas requieren al menos **X sesiones base**.
- Un porcentaje de empresas requiere además **sesiones adicionales**.

### Parámetros de entrada
- Número de sesiones base por empresa (X)
- % de empresas que solo requieren sesiones base
- Número promedio de sesiones adicionales (Y)
- Duración de sesiones base (minutos)
- Duración de sesiones adicionales (minutos)

### Valores predeterminados
- % empresas solo sesiones base: **70%**
- Sesiones adicionales promedio: **2**
- Duración sesiones base: **120 min**
- Duración sesiones adicionales: **120 min**

### Cálculo del tiempo medio por empresa

Tiempo de orientación por empresa:

- Sesiones base + sesiones adicionales ponderadas por su probabilidad

---

## 6. Tiempos de proceso por expediente

### Inscripción
- Tiempo distinto el primer mes y a partir del segundo mes

| Proceso      | Mes 1 (min) | Mes ≥2 (min) |
|-------------|-------------|--------------|
| Inscripción | 132         | 66           |

### Procesos con tiempo constante

| Proceso          | Tiempo (min/expediente) |
|------------------|--------------------------|
| Asesoramiento    | 6                        |
| Evaluación       | 7.2                      |
| Acreditación     | 9.6                      |

---

## 7. Demanda de entrada y escenarios

La principal variable para la generación de escenarios es el **número de empresas por tipo y mes**.

### Escenarios soportados
- Moderado (baseline)
- Agresivo
- Conservador

### Escenario moderado (valores por defecto)

| Mes | Pequeñas | Medianas | Grandes |
|----|----------|----------|---------|
| 1  | 1        | 1        | 1       |
| 2  | 10       | 10       | 10      |
| 3  | 20       | 20       | 20      |
| 4  | 50       | 50       | 50      |
| 5  | 50       | 50       | 50      |

Los escenarios agresivo y conservador se generan mediante factores multiplicativos sobre estos valores.

---

## 8. Capacidad y recursos

- Unidad de capacidad: **persona / mes (FTE)**
- Capacidad productiva por persona:
  - 160 horas / mes
  - 9.600 minutos / mes

### Supuestos
- Cada persona trabaja **en un único proceso** (sin polivalencia).
- La productividad es constante en todos los meses.

---

## 9. Supuestos clave de planificación

- **No existe backlog**.
- Se asume que el número de personas se ajusta cada mes para absorber toda la carga.
- El modelo responde a la pregunta:

> “¿Cuántas personas necesito este mes para procesar toda la demanda?”

---

## 10. Outputs del simulador

### Nivel analítico (por proceso y mes)
- Carga de trabajo (minutos)
- Capacidad disponible (minutos)
- Personas asignadas
- FTE necesarios reales
- Nivel de saturación

### Nivel ejecutivo
- FTE máximo requerido por proceso
- Saturación máxima por proceso
- Indicadores agregados clave

---

## 11. Interfaz de usuario (UI)

- Interfaz visual desarrollada en **Streamlit**
- Inputs modificables mediante formularios
- Valores predeterminados cargados al iniciar la aplicación
- Ejecución de simulaciones en tiempo real

---

## 12. Alcance explícitamente fuera del modelo

- Backlog o colas
- Retrabajos
- Variabilidad estocástica
- Curvas de aprendizaje
- Polivalencia de recursos
- SLAs o tiempos máximos de espera

---

## 13. Naturaleza del modelo

- Determinista
- Transparente
- Explicable
- Orientado a planificación y toma de decisiones

Este documento define el **alcance final y estable** del simulador PAC, sirviendo como referencia funcional y base para futuras extensiones controladas.

