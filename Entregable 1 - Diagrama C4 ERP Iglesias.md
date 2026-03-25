# Diagrama Modelo C4 del Proyecto: ERP Iglesias

**Nombre de la Materia:** Arquitectura de Software

**Nombre Estudiante:** Sebastián Puentes González

**Código de Estudiante:** 9022224363

**Fecha:** 18/03/2026

---

## 1. Introducción al Proyecto ERP Iglesias

El proyecto **ERP Iglesias** es una aplicación de gestión empresarial (ERP) diseñada para centralizar la administración de congregaciones religiosas. El sistema permite gestionar de manera integral el registro de miembros, la oferta académica (cursos), las inscripciones y, fundamentalmente, el flujo financiero a través de módulos de pagos y ofrendas. Arquitectónicamente, el sistema se define como un monolito moderno con una clara separación de responsabilidades entre el cliente y el servidor.

---

## 2. Modelo C4

### 2.1 Descripción del Modelo C4 Nivel 1: Contexto del Sistema

El sistema interactúa principalmente con tres perfiles de usuario: Administradores, Tesoreros y Miembros. En esta etapa de desarrollo, el ERP funciona como un sistema autónomo, ya que no se detectaron dependencias críticas con servicios de terceros (como pasarelas de pago externas o APIs de mensajería) en el análisis de dependencias.

![Diagrama C4 Nivel 1: Contexto del Sistema](/img/Diagrama%20Nivel%201.png)

---

### 2.2 Descripción del Modelo C4 Nivel 2: Contenedores

La infraestructura se basa en una orquestación de tres contenedores principales mediante Docker:

- **Frontend (Angular 17):** Una Single Page Application (SPA) encargada de la experiencia de usuario y la comunicación asíncrona mediante JSON.

- **Backend API (Spring Boot 3.2):** Un servicio REST que centraliza la lógica de negocio y la seguridad.

- **Base de Datos (PostgreSQL 16):** Motor relacional para la persistencia de datos.

![Diagrama C4 Nivel 2: Contenedores](/img/Diagrama%20Nivel%202.png)

---

### 2.3 Descripción del Modelo C4 Nivel 3: Componentes backend

Se profundizó en el contenedor del Backend, identificando un flujo de control que inicia en el JwtAuthFilter para la validación de identidad. Un hallazgo relevante es que la lógica de negocio en los módulos de Payment y Offering reside directamente en los Controllers. Estos componentes se comunican con repositorios especializados (PaymentRepository, OfferingRepository) para realizar operaciones CRUD y transacciones sobre PostgreSQL.

![Diagrama C4 Nivel 3: Componentes backend](/img/Diagrama%20Nivel%203.png)

---

## 3. Justificación de Decisiones Arquitectónicas

### A. Estrategia de Despliegue con Docker

Se utilizó Docker Compose para garantizar que los entornos de desarrollo, prueba y producción sean idénticos. La separación en contenedores permite:

**Aislamiento de red:** La base de datos no es accesible públicamente, solo el backend puede comunicarse con ella.

**Persistencia:** El uso de volúmenes (db_data) asegura que la información financiera no se pierda al reiniciar los servicios.

---

### B. Seguridad Basada en JWT (Stateless)

La implementación de Spring Security con tokens JWT se justifica por:

**Escalabilidad:** Al no mantener sesiones en el servidor, el backend puede escalar horizontalmente sin problemas de sincronización de estado.

**Desacoplamiento:** El frontend gestiona la persistencia del token de forma independiente, enviándolo en cada cabecera de petición.

---

### C. Patrón de Diseño en el Backend

Aunque no se implementó una capa de servicios intermedios para todos los módulos, la estructura actual de controladores y repositorios JPA facilita una implementación rápida y un acceso a datos eficiente mediante el ORM Hibernate.
