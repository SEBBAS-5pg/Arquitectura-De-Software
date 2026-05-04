# ARQUITECTURA DE SOFTWARE 🏗️

## Sebastián Puentes Gonzalez 👨🏻‍💻

| Lunes               | Martes | Miercoles           | Jueves | Viernes |
| :------------------ | :----- | :------------------ | :----- | :------ |
| -                   | -      | -                   | -      | -       |
| -                   | -      | -                   | -      | -       |
| -                   | -      | -                   | -      | -       |
| 8:20 - Salon C5 508 | -      | 8:20 - Salon C5 508 | -      | -       |

## Docente: Luis Angel Vargas Narvaez 👨🏻‍🏫

# Foro Corte 3️⃣

Esta sección explica los conceptos técnicos de nuestra infraestructura mediante analogías sencillas, alineadas con el **AWS Well-Architected Framework**.

## Iteración 1: Seguridad y el Principio de Menor Privilegio (IAM) 🔐

**Concepto:** Seguridad en la transición de Monolito a Serverless.

> "Imagina que antes vivías en un edificio de apartamentos (Servidores/Monolito) donde había un portero que vigilaba la entrada principal. Al mudarte a Serverless, es como si ahora vivieras en una serie de pequeñas cabañas individuales en un bosque. Ya no hay un portero central; ahora la seguridad depende de que **cada cabaña** tenga su propia llave específica y que nadie deje las ventanas abiertas por accidente. Si le das a alguien una 'llave maestra' (permisos excesivos) y la pierde, todas tus cabañas están en peligro."

## Iteración 2: Optimización de Costos y Presupuestos 💰

**Concepto:** Gestión de presupuestos y variabilidad de gasto.

> "Imagina que tienes un coche eléctrico que solo pagas por los metros que recorres (Serverless). Es genial porque si no lo usas, no pagas. Sin embargo, si el coche tiene un error y se queda encendido toda la noche intentando arrancar (Cold Starts) o si haces 10,000 viajes cortos para llevar una sola naranja en cada uno (operaciones ineficientes en DynamoDB), la factura será mucho más alta que si hubieras alquilado un coche por un día completo. La optimización consiste en **planificar los viajes para llevar todas las naranjas de una sola vez**."

## Iteración 3: Rendimiento y Mitigación de Cold Starts ⚡

**Concepto:** Mitigación de Cold Starts y Latencia en Lambda.

> "Imagina que tienes un chef (AWS Lambda) que solo viene a tu cocina cuando pides un plato. Si el chef llega y tiene que ponerse el uniforme, lavarse las manos y sacar los ingredientes, eso es un **Cold Start** (tarda mucho). Si pides otro plato rápido, el chef ya está listo (**Warm Start**). La **Capacidad Provisionada** es como pagarle al chef para que esté siempre en la cocina sentado, listo para saltar al fuego en cuanto suene la campana."

## Iteración 4: Desacoplamiento de Monolitos con Eventos 🔄

**Concepto:** Uso de SQS y DynamoDB para separar procesos.

> "En un restaurante tradicional (Monolito), el mismo mesero toma el pedido, cocina y cobra; si llegan 50 personas, colapsa. Desacoplar es poner una **bandeja de pedidos (SQS)**: el mesero pone la orden ahí y se va. Luego, los cocineros (Lambdas) toman los pedidos de la bandeja a su propio ritmo y guardan los ingredientes en una **despensa inteligente (DynamoDB)** que se expande sola. El reto es no perder los pedidos si la bandeja se llena demasiado."

## Iteración 5: La Arquitectura Viva - Estrategia Maestra 🏛️

**Concepto:** Arquitectura N-Niveles vs. Serverless.

> "Construir una arquitectura **N-Niveles** es como construir tu propia mansión: tú eres el dueño y responsable de que el agua llegue, de la seguridad y de pagar la luz aunque solo uses una habitación. **Serverless** es como vivir en un hotel de lujo: si necesitas una cena para 100 personas, el hotel habilita un salón instantáneamente. Pagas solo por los platos servidos. Tú te concentras en la receta del pan (tu código) y el hotel (AWS) se encarga de que los hornos funcionen."

# Foro Corte 2️⃣

Este corte se enfoca en el **Modelo C4** y su aplicación para mejorar la comunicación y documentación de arquitecturas de software modernas.

## Iteración 1: Comparativa UML vs Modelo C4 📊

Este repositorio contiene ejemplos prácticos para debatir la carga cognitiva en la arquitectura de software.

| Tipo de Diagrama      | Propósito                                | Ejemplo Renderizado                              |
| :-------------------- | :--------------------------------------- | :----------------------------------------------- |
| **UML (Secuencia)**   | Detalle técnico y flujo de llamadas.     | [Ver UML](/Corte-2/Iteracion-1/uml-sequence.mmd) |
| **C4 (Contenedores)** | Estructura de alto nivel y comunicación. | [Ver C4](/Corte-2/Iteracion-1/c4-containers.mmd) |

## Iteración 2: El Nivel 2 (Contenedores) y la Salud del Sistema 🏗️

Análisis del **Diagrama de Contenedores** (Nivel 2) para identificar fallos antes de la implementación:

- **Acoplamiento Excesivo:** Identificación de posibles "monolitos distribuidos".
- **Single Point of Failure (SPOF):** Visualización física de cuellos de botella y puntos críticos de fallo.

[Ver Contenido Detallado](/Corte-2/Iteracion-2/Iteracion-2.html)

## Iteración 3: El Nivel de Componentes y la Agilidad ⚡

Debate sobre el **Nivel 3 (Componentes)** y el riesgo de la "erosión arquitectónica":

- **Cuándo usar Nivel 3:** En sistemas complejos con lógica distribuida o equipos grandes.
- **Componente vs Clase:** Evitar el mapeo 1:1 de clases para no generar burocracia técnica.

| Recurso           | Descripción                                           | Link                                                   |
| :---------------- | :---------------------------------------------------- | :----------------------------------------------------- |
| **C4 Components** | Ejemplo de nivel 3 para evitar granularidad excesiva. | [Ver C4](/Corte-2/Iteracion-3/c4-components-error.mmd) |

## Iteración 4: Ontología y Estándares Internacionales (ISO 42010) 📐

Relación entre el Modelo C4 y el estándar **ISO/IEC/IEEE 42010:2011**:

- **Vistas y Puntos de Vista:** Cómo los niveles de zoom de C4 satisfacen las preocupaciones de diferentes stakeholders.
- **Trazabilidad:** El proceso de "Zooming" asegura la coherencia y gobernanza arquitectónica.

[Ver Análisis ISO 42010](/Corte-2/Iteracion-4/Iteracion-4.html)

## Iteración 5: Conclusión Maestra - La Arquitectura Viva 🚀

Transición hacia la **Arquitectura como Código (Diagrams as Code - DaC)**:

- **Integración CI/CD:** Uso de Mermaid.js y pipelines para mantener diagramas actualizados automáticamente.
- **Impacto DevOps:** Eliminación de la obsolescencia documental, permitiendo que el diseño y el código evolucionen juntos.

[Ver Conclusión Final](/Corte-2/Iteracion-5/Iteracion-5.html)

# Foro Corte 1️⃣

## Tema 1: Escalabilidad con Singleton y Factory ️

### Objetivo:

Evaluar cómo los patrones creacionales aseguran la escalabilidad en sistemas distribuidos.
Pregunta detonante: "¿Crees que Singleton o Factory es más crítico para la escalabilidad de un sistema grande? ¿Cómo ha evitado el 'código espagueti' en tus proyectos, o qué riesgos has visto si se implementan mal?"

## Tema 2: Observer vs. Código Modular

### Objetivo:

Explorar patrones comportamentales para mantener la calidad en arquitecturas desacopladas.
Pregunta detonante: "Entre Observer y otros patrones comportamentales, ¿cuál priorizarías para evitar dependencias rígidas y código espagueti en apps de gran escala? Comparte un ejemplo real o hipotético de tu experiencia."

## Tema 3: Adapter y Adaptabilidad Estructural

### Objetivo:

Analizar patrones estructurales en la integración de legacy code con sistemas modernos.
Pregunta detonante: "¿Es Adapter el patrón estructural más esencial para escalabilidad en proyectos grandes? ¿Cómo lo usarías para prevenir refactorizaciones caóticas, y qué alternativa propones si falla?"

## Tema 4: Strategy para Flexibilidad Dinámica

### Objetivo:

Examinar patrones comportamentales en escenarios de cambio frecuente de algoritmos.
Pregunta detonante: "De los patrones estudiados, ¿Strategy supera a otros como Factory para garantizar escalabilidad sin código espagueti? ¿En qué proyecto lo aplicarías primero y por qué?"

## Tema 5: Decorator y Extensibilidad sin Romper

### Objetivo:

Discutir patrones estructurales para agregar funcionalidades sin alterar código base.
Pregunta detonante: "¿Consideras Decorator más crítico que Singleton para escalabilidad en sistemas grandes? ¿Cómo previene el spaghetti code en tu opinión, basado en un caso práctico?"

---

_Actualizado para reflejar el progreso del Segundo Corte._
