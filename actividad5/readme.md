# Conceptos de Sistemas Operativos

## Tipos de Kernel y sus diferencias

### 1. Monolítico
- **Descripción**: Un kernel monolítico es una única gran capa de software que incluye todos los servicios esenciales del sistema operativo como la gestión de memoria, la gestión de procesos, el manejo de dispositivos, etc.
- **Ventajas**:
  - Alto rendimiento debido a la comunicación interna rápida.
  - Directo acceso a los recursos del hardware.
- **Desventajas**:
  - Más difícil de mantener y depurar debido a su tamaño y complejidad.
  - Si una parte del kernel falla, todo el sistema puede colapsar.

### 2. Microkernel
- **Descripción**: Un microkernel es un diseño minimalista que incluye solo los componentes básicos esenciales (como la comunicación entre procesos y la gestión de memoria básica). Otros servicios del sistema operativo (como los drivers y sistemas de archivos) se ejecutan en modo de usuario como servidores separados.
- **Ventajas**:
  - Mejor aislamiento de fallos: si un componente falla, no compromete el núcleo del sistema.
  - Mayor modularidad y facilidad para añadir nuevas funcionalidades.
- **Desventajas**:
  - Potencialmente menos eficiente debido a la sobrecarga de la comunicación entre los componentes.

### 3. Híbrido
- **Descripción**: Los kernels híbridos combinan aspectos del diseño monolítico y microkernel. Aunque son mayormente monolíticos, se dividen en módulos que pueden cargarse o descargarse según sea necesario.
- **Ventajas**:
  - Combina el rendimiento del kernel monolítico con la modularidad del microkernel.
  - Mayor flexibilidad en la gestión de recursos y controladores.
- **Desventajas**:
  - Puede no alcanzar la simplicidad de un microkernel puro ni la eficiencia de un monolítico puro.

### 4. Exokernel
- **Descripción**: Los exokernels son un diseño experimental que busca minimizar la abstracción y el manejo de recursos del sistema operativo, delegando la mayoría de las funciones a la aplicación en sí.
- **Ventajas**:
  - Máxima flexibilidad para las aplicaciones, que pueden gestionar recursos de manera personalizada.
  - Potencial para un rendimiento muy alto en aplicaciones especializadas.
- **Desventajas**:
  - Más difícil de programar y mantener debido a la baja abstracción.
  - Mayor riesgo de errores de seguridad y gestión ineficiente de recursos.

## User vs Kernel Mode

### User Mode (Modo de Usuario)
- Es el modo de operación en el que se ejecutan las aplicaciones. Aquí, el acceso directo al hardware está restringido y las aplicaciones solo pueden interactuar con los recursos del sistema operativo a través de llamadas a la API.
- **Restricciones**:
  - Las aplicaciones no pueden realizar operaciones críticas como acceder directamente a la memoria o interactuar con el hardware.
  - Intentar realizar operaciones privilegiadas provoca una excepción.

### Kernel Mode (Modo de Kernel)
- Es el modo de operación en el que se ejecuta el núcleo del sistema operativo. En este modo, el código tiene acceso completo a todos los recursos del sistema, incluyendo la memoria y el hardware.
- **Privilegios**:
  - El kernel puede ejecutar cualquier instrucción y acceder a cualquier área de memoria.
  - La mayoría de las operaciones críticas (como la gestión de interrupciones y la programación de tareas) ocurren en modo de kernel.

### Diferencias Clave
- **Acceso a Recursos**: En Kernel Mode, el código tiene acceso total a los recursos del sistema, mientras que en User Mode, el acceso es restringido.
- **Seguridad**: User Mode es más seguro ya que los errores en este modo no pueden dañar el sistema entero, mientras que errores en Kernel Mode pueden ser críticos.
- **Transición**: Las aplicaciones en User Mode hacen llamadas al sistema para pedir que el kernel realice acciones en su nombre, lo que resulta en una transición temporal al Kernel Mode.

## Interruptions vs Traps

### Interruptions (Interrupciones)
- **Definición**: Son señales enviadas al procesador por hardware o software que indican que un evento ha ocurrido y necesita atención inmediata.
- **Tipos**:
  - **Hardware Interrupts**: Generadas por dispositivos de hardware, como cuando se presiona una tecla o se recibe un paquete de red.
  - **Software Interrupts**: Generalmente generadas por el software para solicitar servicios del sistema operativo.
- **Ejemplo**: Un dispositivo de red que notifica al procesador sobre la llegada de un nuevo paquete de datos.

### Traps
- **Definición**: Son un tipo de interrupción generada por el software, típicamente como resultado de una excepción o de una operación que necesita intervención del kernel (como un sistema de llamadas).
- **Tipos**:
  - **Exception Traps**: Se generan cuando ocurre un error o evento excepcional, como una división por cero o un acceso a una dirección de memoria inválida.
  - **System Call Traps**: Utilizadas por el software para solicitar servicios del sistema operativo (como leer un archivo o iniciar un proceso).
- **Ejemplo**: Una instrucción que provoca una división por cero, lo que genera una trampa para que el sistema operativo maneje la excepción.
