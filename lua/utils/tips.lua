local M = {}

local tips = {
	[[ Puedes tener marcas globales (es decir, marcas para otros archivos
    que no sean el actual) pero usando marcas de letras mayúsculas
    (como `mA`). ]],
	[[ `dw`: borrar todo a la derecha desde el cursor hasta el inicio de
    la siguiente palabra (y ponerlo en el registro por defecto) ]],
	[[ `y`: se usa para tirar (copiar) lo que estaba seleccionado ]],
	[[ Pulsa `<C-o>` para ejecutar un comando de modo normal en modo inserción. ]],
	[[ `:v/./.,/./-1join`: comprimir líneas en blanco ]],
	[[ Puede ocultar todas las ventanas excepto la enfocada con `:only`. ]],
	[[ `p`: pegar el registro por defecto ]],
	[[ Una vez que salte a un carácter en la misma línea con `f<char>`,
    puede saltar a la siguiente ocurrencia con `;`. ]],
	[[ `_` es el registro del "agujero negro". Puedes usarlo para borrar cosas
    sin sobrescribir un buffer como en `"_dd`. ]],
	[[ `/texto`: buscar `texto` hacia adelante ]],
	[[ `g/^$/;,/^$/-1! sort`: ordena cada bloque (nótese el ; crucial) ]],
	[[ Si desea guardar un archivo de sólo lectura (olvidó abrir `nvim` con `sudo`),
    use el siguiente comando: `:w !sudo tee %` ]],
	[[ `O`: Insertar en la nueva línea superior, pasa a modo inserción. ]],
	[[ `q<reg>`: grabar las pulsaciones de teclas para registrar comando
    en un registro [a-z]  ]],
	[[ Usa `<C-^>` para ir al archivo alternativo (anterior).
    (Es muy útil cuando a menudo necesitas alternar entre dos archivos en los
    que estás trabajando). ]],
	[[ `*`/`g*`, `#`/`g#`: encuentra la palabra bajo el cursor (adelante/atrás) ]],
	[[ `A`: Añadir al final de la línea, pasa a modo inserción. ]],
	[[ `:%s/^(.*\\)\\n\\1/\\1/`: Eliminar líneas duplicadas ]],
	[[ Utilice `f<char>` para desplazarse a un carácter de la línea actual.
    Es útil cuando se combina con acciones como `df)`. ]],
	[[ Puedes usar `<C-[>` como reemplazo de `<Esc>`. ]],
	[[ `:h slash<C-d>`: escriba control-D y obtendrá una lista de todos los
    temas de ayuda que contengan `slash` ]],
	[[ Simplemente escribe en modo normal: `:help!` ]],
	[[ `<Tab>`: usa el tabulador para desplazarte por los comandos que
    empiezan por lo que has escrito ]],
	[[ `/\\v^(.*)(\\r?\\n\\1)+$`: Ver las líneas duplicadas (muy mágico) ]],
	[[ `vim.g.smartcase = true`: distingue entre mayúsculas y minúsculas
    si la búsqueda contiene un carácter en mayúscula ]],
	[[ Puedes buscar con límite de palabra haciendo `/\\<palabra\\>`. ]],
	[[ `:%normal @a`: ejecutar la macro grabada en el registro a en todas
    las líneas del fichero actual. ]],
	[[ `:20,25 !rot13`: ejecuta el comando `rot13` desde la línea 20 hasta la línea 25 ]],
	[[ `i`: modo de inserción. Las siguientes teclas se insertan en el archivo. ]],
	[[ Utilice `=%` para sangrar un bloque de código. ]],
	[[ `u`: deshacer el último comando, una y otra vez ]],
	[[ `:'v,'w!sort`: ordena desde la línea marcada con v hasta las
    líneas marcadas con w ]],
	[[ En modo normal, usa `<C-o>` (o `<C-i>`) para retroceder (o avanzar) en
    el historial de saltos. ]],
	[[ `:%s/.*/\\L&/`: Modifica "HTML" por "html" ]],
	[[ Usa `g;` para ir a una posición de edición anterior, `g,` para ir a la siguiente. ]],
	[[ Puede ocultar una ventana con el comando `:hide`. ]],
	[[ `:x`: escribir y salir ]],
	[[ `x`: borrar carácter bajo el cursor ]],
	[[ Simplemente escribe en modo normal: `:help holy-grail` ]],
	[[ `h`, `j`, `k`, `l`: mover cursor (h:←, j:↓, k:↑, l:→) ]],
	[[ Puedes escribir `vit` para seleccionar etiquetas XML (y HTML). ]],
	[[ `:wq`: escribir y salir ]],
	[[ `:%s/<search>/<replace>/igc`: comando general de sustitución. ]],
	[[ Utilice `=` para sangrar el código. Más útil si se combina con el modo visual
    o con un parámetro de conteo antes. ]],
	[[ `@a`: ejecutar comandos de nuevo ]],
	[[ `\\v`: (más mágico) reduce el uso del backslash (`\\`). ]],
	[[ Habilite la opción `relativenumber` para tener números de línea relativos.
    Facilita la realización de acciones con un prefijo de recuento. ]],
	[[ Puedes usar números para buscar los registros de borrado.
    Por ejemplo `"1p` pegará el último borrado, `"2p` pegará el penúltimo... ]],
	[[ Además del modo visual, hay un modo visual de línea que se activa con `<S-v>` y un
    modo visual de bloque que se activa con `<C-v>`. Puedes pasar de un modo a otro sin
    volver al modo normal pulsando los bindings correspondientes. ]],
	[[ `:%!sort -u`: se ordena el contenido del fichero actual y sólo se conservan las
    líneas únicas ]],
	[[ `o`: Insertar en la nueva línea inferior, pasa a modo inserción. ]],
	[[ `@@`: repetir última macro ]],
	[[ `:s/\\v([abc])([efg])/\\2\\1/g`: Modifica "af fa bg" por "fa fa gb" ]],
	[[ `/^\\(.*\\)\\(\\r?\\n\\1)\\+$`: Ver las líneas duplicadas ]],
	[[ `:v/./,/./-j`: Comprimir líneas en blanco en una línea en blanco ]],
	[[ Cuando ha seleccionado un bloque con `vi{`, puede seleccionar el bloque exterior
    escribiendo `i{` y puede hacer esto tantas veces como quiera.
    (Suena útil para los programadores de lisp). ]],
	[[ Pulsando `o` en modo visual se cambia el cursor al otro extremo de la selección ]],
	[[ `q`: salir de la grabación ]],
	'`:s/a\\|b/xxx\\0xxx/g`: Modifica "a b" por "xxxaxxx xxxbxxx"',
	[[ `!1} sort`: ordena un párrafo ]],
	'`:s/\\v([ab])|([cd])/\\1x/g`: Modifica "a b c d" por "ax bx x x"',
	'`:s/\\v\\w+/\\u\\0/g`: Modifica "bla bla" a "Bla Bla"',
	[[ `<C-g>` muestra algo de información (`g<C-g>` muestra más información) sobre
    el archivo actual. ]],
	'`:g/green/d`: borrar todas las líneas que contengan "green"',
	[[ Se puede usar `_` en lugar de `^` para ir al primer carácter que no esté en blanco. ]],
	[[ `:w nombrefichero` : escribe una copia del fichero que estás editando como `nombrefichero` ]],
	[[ En modo visual, filtra tu selección con un comando del shell tecleando `!command`.
    Es útil para ordenar tu archivo, por ejemplo: `Vip!sort`. ]],
	[[ Aumenta/disminuye el tamaño de una ventana con `<C-w>+`/`<C-w>-`.
    Puede utilizar la opción `[count]` antes de especificar cuántas líneas (o columnas) desea
    aumentar/disminuir a la vez. ]],
	[[ Para ir al final de la palabra anterior, escriba `ge`. ]],
	[[ `:s/fred/<C-r>a/g`: sustituye "fred" por el contenido del registro "a".',
	[[ Utilice `zt`, `zz` o `zb` para desplazar la vista hacia arriba, hacia el
    centro o hacia abajo, respectivamente. ]],
	[[ `:g/^pattern/s/$/mytext`: Buscar y añadir texto al final ]],
	[[ `:q!`: salir sin guardar aunque se hayan hecho cambios ]],
	[[ El comando `:changes` muestra la lista de cambios, con un número para cada uno que
    puedes poner delante de `g;` o `g,` para ir a ese cambio específico. ]],
	[[ `:g/<p1>/,/<p2>/d`: Borrar inclusivamente de <p1> a <p2> ]],
	[[ `dd`: borrar línea (y ponerla en el registro por defecto) ]],
	[[ `:%s/\\r//g`: borrar retornos de carro DOS (^M). ]],
	[[ Muévase por línea visual (en lugar de por línea real) con `gj` y `gk`.
    Si prefieres esa forma de moverte, puedes remapear `j` y `k` a estas. ]],
	[[ Mapea la tecla líder a alguna tecla accesible como espacio (`vim.g.mapleader = " "`) o la que
    crea mas conveniente y crea bindings para poder hacer acciones comunes más rápido como:
    `vim.keymap.set("n", "<Leader>w", "<cmd>:w<CR>")`. ]],
	[[ Usa `gv` para recrear la última selección. ]],
	[[ El `0` va al principio de la línea, pero si quieres ir al primer carácter no
    espaciado de la línea, usa `^` (o `_`). ]],
	[[ `vim.g.ignorecase = true` : Establece que no distingue entre mayúsculas y minúsculas ]],
	[[ `%` : coincide con paréntesis (`{`, `}`, `[`, `]`, `(`, `)`) ]],
	[[ Utilice el registro `+` y `*` para acceder al portapapeles del sistema y la selección.
    Necesitas que `nvim` esté compilado con `+clipboard` para que funcione o `neovim` + `xclip`. ]],
	[[ `v`: modo visual, se usa para seleccionar texto con el movimiento del cursor o el ratón ]],
	[[ `:%s/</\\=(\\w\\+\\)\\>/\\U&/g`: Convertir etiquetas HTML a mayúsculas ]],
	[[ Puede eliminar los espacios finales con el comando `:%s/\\s\\+$/`. ]],
	[[ Usa `<C-a>`/`<C-x>` para incrementar/decrementar el siguiente número. Es muy útil en macros. ]],
	[[ En modo normal, usa <C-e> y <C-y> para mover la vista arriba y abajo. ]],
	[[ `:r!date:` inserta la fecha ]],
	[[ `:s/\\v<(.)(\\w*)/\\u\\1\\L\\2/g`: Hace mayúsculas todas las primeras letras de una palabra ]],
	[[ Usa `<C-]>` para navegar a través de un enlace en las páginas de ayuda. ]],
	[[ `@@` ejecuta la última macro ejecutada. ]],
	[[ `:1,20normal @a` ejecutar la macro grabada en el registro a desde la línea 1 hasta la 20. ]],
	[[ `:%s/^\\(.*\\)\\n\\1/\\1$/`: borrar líneas duplicadas. ]],
	[[ Simplemente escribe en modo normal: `:help 42` ]],
	[[ `<Esc>`: Regresar de cualquier modo al modo normal. ]],
	[[ `:v/green/d`: borrar todas las líneas que NO contengan "green" ]],
	[[ Utilice `gf` para abrir el archivo con el nombre procedente de la palabra situada bajo
    el cursor. ]],
	[[ `:help`: mostrar ayuda ]],
	[[ `:%s/__date__/\\=strftime("%c")/`: insertar cadena de fecha en todas las líneas que
    contengan "__date__". ]],
	[[ Pulsando `%` en modo normal se pasa al paréntesis correspondiente. ]],
	[[ Puedes crear una sesión con :mksession <nombre> y recargar esa sesión más tarde con
    `:source <nombre>`. Hay muchos parámetros para configurar lo que va en el archivo de sesión. ]],
	[[ `:r!ls`: lee la salida de ls ]],
	[[ Utiliza `{` (o `}`) para ir a la línea en blanco anterior (siguiente). ]],
	[[
La introducción de `!!` en modo normal se traduce a `:.!`. Añadir un comando envía la línea actual al
comando reemplazándola por el resultado del comando:
- `!!date`: Reemplaza la línea actual por la fecha
- `!!which command`: Reemplaza la línea actual con la ruta absoluta al comando
- `!!tr -d AEIO`: traduce la línea actual borrando A, E, I, y O de la línea actual
 ]],
	[[
Puede utilizar `!` en una selección visual. Seleccione un área con uno de los comandos de modo visual
y, a continuación, escriba `! comando` para canalizar toda la selección a través del `comando`.
Esto equivale a :'<,'>!comando
Por ejemplo, después de seleccionar varias líneas en modo visual:
- `!sort`: ordena las líneas seleccionadas
- `!grep palabra`: guarda sólo las líneas que contengan 'palabra' en el rango seleccionado.
 ]],
	[[
Los modos de Neovim son:
Normal, Inserción, Comando, Visual, Seleccion, Operación y Terminal.
`<Esc>` devuelve de cualquier modo al modo normal
 ]],
	[[
Introduce un número antes de un comando para repetirlo, ejemplos:
10w : saltar hacia adelante 10 palabras
10dd : borrar 10 líneas
 ]],
	[[
Los comandos distinguen entre mayúsculas y minúsculas:
c : inicia un comando de cambio
C : cambiar a final de línea (igual que c$)
ce : cambiar a final de palabra (un comando de cambio completo)
 ]],
}

M.RandomTip = function()
	return tips[math.random(1, #tips)]
end

return M
