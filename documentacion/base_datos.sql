USE asistencia;

CREATE TABLE Integracion
(
    id_integracion    INT AUTO_INCREMENT PRIMARY KEY,
    sistema_externo   VARCHAR(100) NOT NULL,
    fecha_vinculacion DATE NOT NULL,
    tipo_integracion  VARCHAR(100) NOT NULL,
    detalles          TEXT NULL
);

CREATE TABLE Rol
(
    id_rol INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);

CREATE TABLE Persona
(
    id_persona     INT AUTO_INCREMENT PRIMARY KEY,
    nombre         VARCHAR(100) NOT NULL,
    apellido       VARCHAR(100) NOT NULL,
    correo         VARCHAR(100) NOT NULL UNIQUE,
    rol_id         INT NOT NULL,
    estado         ENUM('activo', 'inactivo') DEFAULT 'activo' NOT NULL,
    fecha_creacion DATE NOT NULL,
    CONSTRAINT fk_rol FOREIGN KEY (rol_id) REFERENCES Rol(id_rol)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

CREATE TABLE Usuario
(
    id_usuario     INT AUTO_INCREMENT PRIMARY KEY,
    id_persona     INT NOT NULL,
    nombre_usuario VARCHAR(50) NOT NULL UNIQUE,
    contraseña     VARCHAR(100) NOT NULL,
    ultimo_acceso  DATETIME,
    activo         BOOLEAN DEFAULT TRUE,
    CONSTRAINT fk_usuario_persona FOREIGN KEY (id_persona) REFERENCES Persona(id_persona)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE Auditoria
(
    id_auditoria     INT AUTO_INCREMENT PRIMARY KEY,
    id_persona       INT NOT NULL,
    accion_realizada VARCHAR(100) NOT NULL,
    fecha_accion     DATETIME NOT NULL,
    detalles         TEXT NULL,
    CONSTRAINT fk_auditoria_persona FOREIGN KEY (id_persona) REFERENCES Persona(id_persona)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

CREATE TABLE Horario_Excepcional
(
    id_horario_excepcional INT AUTO_INCREMENT PRIMARY KEY,
    id_persona             INT NOT NULL,
    fecha_excepcion        DATE NOT NULL,
    hora_inicio            TIME NOT NULL,
    hora_fin               TIME NOT NULL,
    descripcion            TEXT NULL,
    CONSTRAINT fk_horario_excepcional_persona FOREIGN KEY (id_persona) REFERENCES Persona(id_persona)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

CREATE TABLE Notificacion
(
    id_notificacion    INT AUTO_INCREMENT PRIMARY KEY,
    id_persona         INT NOT NULL,
    tipo_notificacion  ENUM('tardanza', 'ausencia', 'recordatorio') NOT NULL,
    mensaje            TEXT NOT NULL,
    fecha_notificacion DATETIME NOT NULL,
    CONSTRAINT fk_notificacion_persona FOREIGN KEY (id_persona) REFERENCES Persona(id_persona)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

CREATE TABLE Permiso
(
    id_permiso      INT AUTO_INCREMENT PRIMARY KEY,
    id_persona      INT NOT NULL,
    fecha_solicitud DATE NOT NULL,
    fecha_inicio    DATE NOT NULL,
    fecha_fin       DATE NOT NULL,
    estado_permiso  ENUM('pendiente', 'aprobado', 'rechazado') NOT NULL,
    tipo_permiso    ENUM('vacaciones', 'enfermedad', 'otro') NOT NULL,
    CONSTRAINT fk_permiso_persona FOREIGN KEY (id_persona) REFERENCES Persona(id_persona)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

CREATE TABLE Reporte
(
    id_reporte       INT AUTO_INCREMENT PRIMARY KEY,
    id_persona       INT NOT NULL,
    fecha_generacion DATE NOT NULL,
    tipo_reporte     ENUM('diario', 'semanal', 'mensual') NOT NULL,
    contenido        TEXT NOT NULL,
    CONSTRAINT fk_reporte_persona FOREIGN KEY (id_persona) REFERENCES Persona(id_persona)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

CREATE TABLE Tardanza
(
    id_tardanza    INT AUTO_INCREMENT PRIMARY KEY,
    id_persona     INT NOT NULL,
    fecha_tardanza DATE NOT NULL,
    hora_llegada   TIME NOT NULL,
    justificacion  TEXT NULL,
    CONSTRAINT fk_tardanza_persona FOREIGN KEY (id_persona) REFERENCES Persona(id_persona)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

CREATE TABLE Turno
(
    id_turno     INT AUTO_INCREMENT PRIMARY KEY,
    nombre_turno VARCHAR(50) NOT NULL,
    hora_inicio  TIME NOT NULL,
    hora_fin     TIME NOT NULL
);

CREATE TABLE Asistencia
(
    id_asistencia     INT AUTO_INCREMENT PRIMARY KEY,
    id_persona        INT NOT NULL,
    fecha             DATE NOT NULL,
    hora_entrada      TIME NULL,
    hora_salida       TIME NULL,
    estado_asistencia ENUM('a_tiempo', 'tarde', 'ausente') NOT NULL,
    id_turno          INT NULL,
    CONSTRAINT fk_persona FOREIGN KEY (id_persona) REFERENCES Persona(id_persona)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT fk_turno FOREIGN KEY (id_turno) REFERENCES Turno(id_turno)
        ON UPDATE CASCADE
        ON DELETE SET NULL
);

CREATE TABLE Horario_Persona
(
    id_horario_persona INT AUTO_INCREMENT PRIMARY KEY,
    id_persona         INT NOT NULL,
    id_turno           INT NOT NULL,
    fecha_asignacion   DATE NOT NULL,
    CONSTRAINT fk_horario_persona FOREIGN KEY (id_persona) REFERENCES Persona(id_persona)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT fk_horario_turno FOREIGN KEY (id_turno) REFERENCES Turno(id_turno)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);
