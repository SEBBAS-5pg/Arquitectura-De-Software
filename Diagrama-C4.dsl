workspace "ERP Iglesias" "Sistema de gestión integral para congregaciones religiosas." {

    !identifiers hierarchical

    model {
        # Actores
        admin = person "Administrador" "Gestiona usuarios, configuración y reportes."
        tesorero = person "Tesorero" "Registra ofrendas y gestiona finanzas."
        miembro = person "Miembro" "Consulta perfil e inscripciones."

        erpSystem = softwareSystem "ERP Iglesias" "Sistema de gestión." {
            webApp = container "Angular Web Application" "Interfaz de usuario." "Angular 17" "Web Browser"
            
            apiApp = container "Backend API" "Lógica de negocio y seguridad." "Java 17, Spring Boot 3.2" {
                # Componentes de Seguridad
                securityConfig = component "Security Config" "Define políticas de seguridad y filtros." "Spring Security Configuration"
                jwtAuthFilter = component "JWT Auth Filter" "Valida tokens en cada petición HTTP." "OncePerRequestFilter"
                
                # Componentes de Entrada y Lógica (Auditados: Lógica reside en Controllers)
                authController = component "Auth Controller" "Gestión de login y tokens." "Spring MVC RestController"
                paymentController = component "Payment Controller" "Ciclo de vida de pagos y lógica de transición de estados." "Spring MVC RestController"
                offeringController = component "Offering Controller" "Registro de ofrendas y creación de pagos asociados." "Spring MVC RestController"
                
                # Componentes de Datos
                paymentRepo = component "Payment Repository" "Acceso a tabla de pagos." "Spring Data JPA"
                offeringRepo = component "Offering Repository" "Acceso a tabla de ofrendas." "Spring Data JPA"
                personRepo = component "Person Repository" "Validación de miembros." "Spring Data JPA"
            }
            
            database = container "PostgreSQL Database" "Persistencia relacional." "PostgreSQL 16" "Database"
        }

        # Relaciones L1/L2
        admin -> erpSystem.webApp "Usa" "HTTPS"
        tesorero -> erpSystem.webApp "Usa" "HTTPS"
        erpSystem.webApp -> erpSystem.apiApp "Consume REST" "JSON/HTTPS"
        erpSystem.apiApp -> erpSystem.database "JDBC/SQL"

        # Relaciones de Componentes L3 (Flujo Real de Tesorería)
        erpSystem.webApp -> erpSystem.apiApp.jwtAuthFilter "Envía JWT en Header"
        erpSystem.apiApp.jwtAuthFilter -> erpSystem.apiApp.paymentController "Autoriza petición"
        erpSystem.apiApp.jwtAuthFilter -> erpSystem.apiApp.offeringController "Autoriza petición"
        
        # Lógica en Controllers hacia Repositorios
        erpSystem.apiApp.paymentController -> erpSystem.apiApp.paymentRepo "Actualiza estados"
        erpSystem.apiApp.offeringController -> erpSystem.apiApp.offeringRepo "Persiste ofrenda"
        erpSystem.apiApp.offeringController -> erpSystem.apiApp.paymentRepo "Crea pago automático"
        erpSystem.apiApp.offeringController -> erpSystem.apiApp.personRepo "Valida miembro"
        
        # De Repositorios a DB
        erpSystem.apiApp.paymentRepo -> erpSystem.database "SQL"
        erpSystem.apiApp.offeringRepo -> erpSystem.database "SQL"
        erpSystem.apiApp.personRepo -> erpSystem.database "SQL"
    }

    views {
        systemContext erpSystem "Contexto" {
            include *
            autolayout lr
        }
        container erpSystem "Contenedores" {
            include *
            autolayout lr
        }
        component erpSystem.apiApp "Componentes_Backend" {
            include *
            autolayout lr
            description "Desglose del Backend resaltando la lógica en controladores para Tesorería."
        }

        styles {
            element "Person" {
                background #08427b
                color #ffffff
                shape person
            }
            element "Software System" {
                background #1168bd
                color #ffffff
            }
            element "Container" {
                background #438dd5
                color #ffffff
            }
            element "Component" {
                background #85bbf0
                color #000000
            }
            element "Database" {
                shape cylinder
            }
        }
    }
}