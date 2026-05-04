### Intervención 1

**Pregunta o tema:** ¿Cuáles son los principales desafíos de seguridad al migrar a serverless según el Pilar de Seguridad del Well-Architected Framework? [docs.aws.amazon](https://docs.aws.amazon.com/es_es/wellarchitected/latest/security-pillar/wellarchitected-security-pillar.pdf)

**Contexto para prompt:** Desarrolla una intervención para un conversatorio sobre la migración monolítica a serverless en AWS (Lambda, S3, DynamoDB), enfocándote en desafíos de seguridad como gestión de IAM, exposición de datos en S3 y protección contra cold starts maliciosos, citando documentación AWS Well-Architected Pilar de Seguridad y prácticas para Lambda Authorizers. Incluye una pregunta para debatir: ¿Cómo aplicar el principio de menor privilegio en DynamoDB? [aws.amazon](https://aws.amazon.com/es/architecture/well-architected/)

### Intervención 2

**Pregunta o tema:** En el Pilar de Optimización de Costos, ¿qué desafíos presupuestarios enfrenta una arquitectura serverless con Lambda y DynamoDB? [docs.aws.amazon](https://docs.aws.amazon.com/es_es/wellarchitected/latest/cost-optimization-pillar/wellarchitected-cost-optimization-pillar.pdf)

**Contexto para prompt:** Elabora una respuesta sustentada en AWS Well-Architected Pilar de Optimización de Costos para desafíos como invocaciones inesperadas en Lambda, lecturas/escrituras en DynamoDB y costos de transferencia en S3 durante la migración de monolito. Menciona herramientas como AWS Cost Explorer y estrategias de caching. Propón una experiencia teórica: simulación de costos con 10M invocaciones mensuales. [es.linkedin](https://es.linkedin.com/pulse/estrategias-para-optimizar-costos-en-aws-sin-comprometer-la-81skf)

### Intervención 3

**Pregunta o tema:** ¿Cómo mitigar cold starts y latencia en Lambda según el Pilar de Eficiencia de Rendimiento? [docs.aws.amazon](https://docs.aws.amazon.com/es_es/lambda/latest/dg/best-practices.html)

**Contexto para prompt:** Crea una intervención práctica basada en una experiencia teórica de refactorización de monolito a Lambda/S3/DynamoDB, destacando desafíos de seguridad (GuardDuty) y costos (provisioned concurrency), alineado con Well-Architected. Comparte "lección aprendida" de optimización de memoria en Lambda para reducir cold starts, citando docs AWS y un caso como Atende Simples con 10M requests. [aws.amazon](https://aws.amazon.com/es/blogs/aws-spanish/migrando-una-aplicacion-monolitica-para-la-arquitectura-serverless-y-microservicios/)

### Intervención 4

**Pregunta o tema:** Experiencia práctica: ¿Qué retos encontré al desacoplar un monolito usando SQS y DynamoDB en serverless? [aws.amazon](https://aws.amazon.com/es/blogs/aws-spanish/migrando-una-aplicacion-monolitica-para-la-arquitectura-serverless-y-microservicios/)

**Contexto para prompt:** Comparte en el conversatorio una experiencia práctica/teórica de migración monolítica a serverless AWS, enfocada en desafíos de seguridad (sincronización datos, autenticación) y costos (picos de tráfico), sustentado en casos reales como Atende Simples y guías AWS. Incluye reflexión sobre escalabilidad y una pregunta: ¿Vale la pena serverless para cargas variables? [sedici.unlp.edu](http://sedici.unlp.edu.ar/bitstream/handle/10915/144859/Documento_completo.pdf?sequence=1)

### Intervención 5

**Pregunta o tema:** Reflexión final: ¿Cómo AWS facilita arquitecturas n-niveles con Well-Architected? [aws.amazon](https://aws.amazon.com/es/architecture/well-architected/)

**Contexto para prompt:** Reflexiona sobre cómo AWS (EC2 ASG, ELB, RDS, VPC para n-niveles o Lambda/API Gateway/DynamoDB para serverless multi-nivel) implementa arquitecturas n-niveles, alineado con los 6 pilares Well-Architected (seguridad, costos, etc.). Enlaza con la pregunta detonante de migración serverless, citando docs AWS y beneficios como alta disponibilidad en 3-tier. Concluye con recomendación para arquitectos. [docs.aws.amazon](https://docs.aws.amazon.com/wellarchitected/latest/framework/welcome.html)
