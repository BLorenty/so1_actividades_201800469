# Completely Fair Scheduler (CFS)
El Completely Fair Scheduler (CFS) es el planificador predeterminado en el kernel de Linux desde la versión 2.6.23, diseñado para proporcionar una asignación justa y eficiente del tiempo de CPU entre todos los procesos. A continuación te describo sus principales características y funcionamiento:

## Características principales del CFS:

- **Justicia en la asignación del tiempo de CPU**:

    El CFS intenta distribuir el tiempo de CPU de manera "justa" entre todos los procesos activos. Esto significa que cada proceso obtiene una cantidad de tiempo proporcional, sin que ninguno se quede esperando demasiado o monopolice el procesador.

- **Estructura de datos basada en un árbol rojo-negro**:

    El CFS utiliza un árbol rojo-negro para gestionar los procesos en ejecución. Este árbol ordena los procesos según el tiempo de CPU consumido, lo que facilita encontrar y seleccionar el proceso que debe ejecutarse a continuación.

- **Tiempo virtual de ejecución (vruntime)**:

    El CFS asigna a cada proceso un tiempo virtual de ejecución (denominado vruntime), que es una métrica que representa cuánto tiempo ha consumido un proceso en comparación con otros. Cuanto menor sea este valor, más justo ha sido el reparto del tiempo de CPU para el proceso.

    El kernel intenta ejecutar el proceso con el menor vruntime en el sistema, lo que asegura que los procesos con menos tiempo de CPU reciban más atención.

- **Enfoque continuo y sin intervalos predefinidos**:

    A diferencia de otros algoritmos basados en ticks, el CFS no funciona en intervalos fijos (como los planificadores con intervalos de tiempo). En lugar de ello, trata de dar una ejecución continua y equilibrada según la carga de trabajo en tiempo real.

- **Escalabilidad**:

    El CFS está diseñado para escalar eficientemente con un gran número de procesos. La estructura de árbol rojo-negro permite insertar y eliminar procesos de manera eficiente, con un costo logarítmico (O(log n)), donde n es el número de procesos en el sistema.

- **Uso de políticas de prioridad**:

    CFS respeta las prioridades de los procesos. Los procesos con mayor prioridad reciben más tiempo de CPU (lo que se refleja en un menor vruntime), mientras que los procesos con baja prioridad reciben menos CPU. Sin embargo, sigue garantizando que todos los procesos tengan su oportunidad de ejecución.

    El usuario puede establecer la prioridad relativa de los procesos mediante las políticas de nice, donde valores más bajos indican procesos con más prioridad.

- **Soporte para tareas interactivas**:

    El CFS favorece las tareas interactivas (como los programas que requieren de una rápida respuesta a las entradas del usuario). Lo hace reduciendo el vruntime para estos procesos, dándoles más oportunidades de ejecutarse, de modo que se perciban como más rápidos y receptivos.
    
## Funcionamiento del CFS:

- **Selección de procesos**:

    El CFS elige el proceso que se ejecutará basándose en el vruntime de cada proceso. Siempre selecciona el proceso con el menor vruntime del árbol rojo-negro. A medida que los procesos consumen tiempo de CPU, su vruntime aumenta.

- **Actualización de vruntime**:

    Durante la ejecución de un proceso, su vruntime se incrementa. El aumento depende de la cantidad de tiempo real que el proceso ha estado ejecutándose, pero también se ajusta según la prioridad del proceso. Los procesos de baja prioridad tienen un vruntime que crece más rápido, mientras que los de alta prioridad crecen más lentamente.
    
- **Carga de trabajo equilibrada**:

    CFS equilibra la carga de trabajo asegurando que ningún proceso se quede sin tiempo de CPU. Si un proceso ha estado inactivo o ejecutándose en una menor proporción, tendrá un vruntime más bajo, lo que le permitirá ejecutarse con más frecuencia para compensar.

- **Asignación dinámica del tiempo de CPU**:

    El tiempo de CPU asignado a cada proceso no es fijo. CFS ajusta dinámicamente el tiempo de ejecución dependiendo de la carga del sistema. Si hay pocos procesos activos, cada proceso recibe más tiempo de CPU; si hay muchos procesos, se reduce el tiempo de CPU para cada uno.