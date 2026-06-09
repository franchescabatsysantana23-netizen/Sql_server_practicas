/*
constraint_type: tipo de restricción. Si es una restricción de campo (default o check) indica sobre qué campo fue establecida. 
Si es de tabla (primary key o unique) indica el tipo de índice creado.
- constraint_name: nombre de la restricción.

- delete_action: solamente es aplicable para restricciones de tipo "foreign key". Indica si la acción de eliminación actúa, no actúa o es en cascada.

- update_action: sólo es aplicable para restricciones de tipo "foreign key". Indica si la acción de actualización es: No Action, Cascade, or n/a

- status_enabled: solamente es aplicable para restricciones de tipo "check" y "foreign key". Indica si está habilitada (Enabled) o no (Disabled). 

- status_for_replication: solamente es aplicable para restricciones de tipo "check" y "foreign key".

- constraint_keys: Si es una restricción "default" muestra la condición de chequeo; si es una restricción "default", el valor por defecto; 
si es una "primary key","unique" o "foreign key" muestra el/ los campos a los que se aplicaron la restricción.


*/