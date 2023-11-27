// Function to sort an array of strings or numbers
// Input: array of strings or numbers, sort filter ("name" or "number")
// Output: sorted array
function GPT_array_organize(arrayinput, sortfilter)
{
    var i, j, temp;
    var arraysize = array_length_1d(arrayinput);

    // Sort array alphabetically if sort filter is "name"
    if (sortfilter == "name")
    {
        // Loop through each element of the array and compare with the others to sort
        for (i = 0; i < arraysize - 1; i++)
        {
            for (j = i + 1; j < arraysize; j++)
            {
                // Swap the positions of the elements if necessary to sort alphabetically
                if (string_lower(arrayinput[i]) > string_lower(arrayinput[j]))
                {
                    temp = arrayinput[i];
                    arrayinput[i] = arrayinput[j];
                    arrayinput[j] = temp;
                }
            }
        }
    }

    // Sort array numerically if sort filter is "number"
    if (sortfilter == "number")
    {
        // Loop through each element of the array and compare with the others to sort
        for (i = 0; i < arraysize - 1; i++)
        {
            for (j = i + 1; j < arraysize; j++)
            {
                // Swap the positions of the elements if necessary to sort numerically
                if (arrayinput[i] > arrayinput[j])
                {
                    temp = arrayinput[i];
                    arrayinput[i] = arrayinput[j];
                    arrayinput[j] = temp;
                }
            }
        }
    }

    // Return the sorted array
    return arrayinput;
}


/**
 * Searches for a value in a 1D array and returns the indices where the value is found.
 * @param {array} arrayindex - The array to search in.
 * @param {any} value - The value to search for.
 * @returns {array} An array containing the indices where the value is found, or an empty array if the value is not found.
 */
function GPT_array_find(arrayindex, value)
{
    var results = [];
    for (var i = 0; i < array_length(arrayindex); i++) {
        if (arrayindex[i] == value) {
            results.push(i); // Add the index to the results array
        }
    }
    return results;
}

/**
 * Searches for a value in a 1D array and returns the indices where the value is found.
 * @param {array} arrayindex - The array to search in.
 * @param {any} value - The value to search for.
 * @returns {array} An array containing the indices where the value is found, or an empty array if the value is not found.
 */
function GPT_array_find_less(arrayindex, value)
{
	var j = 0;
    var results = [];
    for (var i = 0; i < array_length(arrayindex); i++) {
        if (arrayindex[i] >= value) {
            results[j] = i;
			j++;// Add the index to the results array
        }
    }
	if j != 0  return results;
	else {
		results = [-1];
		return results;
	}
}

/// GPT_array_find_2d(arrayindex, value, column)
//
// Returns an array of indices where the specified value is found in the 2D array.
// The function searches for the value in the specified column (0-indexed).
// If the value is not found, the function returns an empty array.
// Example usage:
// var myArray = [["apple", 2], ["banana", 1], ["orange", 3]];
// var indices = GPT_array_find_2d(myArray, "banana", 0);
// show_message("Indices: " + string(indices));

function GPT_array_find_2d(arrayindex, value, column)
{
    var results = []; // Create an array to store the results
    for (var i = 0; i < array_length(arrayindex); i++) {
        if (arrayindex[i, column] == value) {
            array_push(results, i); // Add the index to the results array
        }
    }
    return results;
}


/// Função para verificar similaridade de strings com margem de erro
/// @param str1 A primeira string
/// @param str2 A segunda string
/// @param tolerancia A margem de erro aceitável (um valor inteiro)

function string_com_margem_erro(string1, string2, tolerancia = 4)
{
    var len1 = string_length(string1);
    var len2 = string_length(string2);
    
    if abs(len1 - len2) > tolerancia
    {
        return false; // As strings têm tamanhos muito diferentes
    }
    
	
	
    var erros = 0;
	erros += floor(abs(len1 - len2)*1.5);
    
    for (var i = 1; i <= min(len1, len2); i++)
    {
        if string_char_at(string1, i) != string_char_at(string2, i)
        {
            erros++;
            if erros > tolerancia
            {
                return false; // A margem de erro foi excedida
            }
        }
    }
    
    return true;
}




// This function takes an array and a value as inputs, and searches the array for the specified value.
// If the value is found, the function returns a string containing the index(es) of the value in the array.
// If the value is not found, the function returns a message saying so.
function GPT_show_values(arrayindex, value)
{
    // Call the GPT_array_find function to search for the value in the array
    var results = GPT_array_find(arrayindex, value);
    
    // If the value was found, create a string containing the index(es) and display it using the show_message function
    if (ds_list_size(results) > 0) {
        var resultString = "Value found at index(es): ";
        for (var i = 0; i < ds_list_size(results); i++) {
            resultString += string(ds_list_find_value(results, i));
            if (i < ds_list_size(results) - 1) {
                resultString += ", ";
            }
        }
        show_message(resultString);
    } 
    
    // If the value was not found, display a message saying so using the show_message function
    else {
        show_message("Value not found in array.");
    }
}

/// GPT_array_organize_2d(arrayinput, sortfilter, columnindex)
//
// Organizes a 2-dimensional array by sorting its rows based on a specified column.
//
// Arguments:
// - arrayinput: the 2d array to be sorted
// - sortfilter: the column index to sort by
// - columnindex: (optional) the column index to return as the sorted array (defaults to sorting by the specified column)
//
// Returns:
// - the sorted 2d array
function GPT_array_organize_2d(arrayinput, sortfilter, column)
{
    var i, j, temp;
    var arraysize = array_length_2d(arrayinput, column);
    
    // Sort array alphabetically or numerically based on the specified column
    if (sortfilter == "name")
    {
        for (i = 0; i < arraysize - 1; i++)
        {
            for (j = i + 1; j < arraysize; j++)
            {
                if (string_lower(arrayinput[i, column]) > string_lower(arrayinput[j, column]))
                {
                    for (var k = 0; k < array_length_1d(arrayinput); k++)
                    {
                        temp = arrayinput[i, k];
                        arrayinput[i, k] = arrayinput[j, k];
                        arrayinput[j, k] = temp;
                    }
                }
            }
        }
    }
    else if (sortfilter == "number")
    {
        for (i = 0; i < arraysize - 1; i++)
        {
            for (j = i + 1; j < arraysize; j++)
            {
                if (arrayinput[i, column] > arrayinput[j, column])
                {
                    for (var k = 0; k < array_length_1d(arrayinput); k++)
                    {
                        temp = arrayinput[i, k];
                        arrayinput[i, k] = arrayinput[j, k];
                        arrayinput[j, k] = temp;
                    }
                }
            }
        }
    }
    
    // Return the sorted array
    return arrayinput;
}


/// draw_clickable_text(x, y, text, clickable_text, callback)
/// Draws text on the GUI with a clickable portion.
/// Arguments:
///     x: The x-coordinate of the top-left corner of the text.
///     y: The y-coordinate of the top-left corner of the text.
///     text: The full text to be displayed.
///     clickable_text: The portion of the text that should be clickable.
///     callback: The code to be executed when the clickable text is clicked.
function GPT_draw_clickable_text(xx, yy, text, clickable_text, callback, clickable_color, arg = 0)
{
    // Set the font and color for the text.
    draw_set_font(Ruler);
    draw_set_halign(fa_left);
	var clickable_padding = 13;
	var ratio = GPT_window_ratio();
    
    // Find the width of the clickable portion of the text.
    var clickable_width = string_width(clickable_text);
    
    // Split the text into two separate strings.
    var prefix = string_copy(text, 1, string_pos(clickable_text, text) - 1);
    var suffix = string_copy(text, string_pos(clickable_text, text) + string_length(clickable_text), string_length(text));
    
    // Draw the prefix with white color.
    draw_set_color(c_white);
    draw_text(xx, yy, prefix);
    
    // Determine the x-coordinate of the clickable portion of the text.
    var clickable_x = xx + string_width(prefix);
	
    // Draw the clickable text with the specified color.
    draw_set_color(clickable_color);
    draw_text(clickable_x, yy, clickable_text);
    
    // Determine the y-coordinate and height of the clickable portion of the text.
    var clickable_y = yy;
    var clickable_height = font_get_size(Ruler);
    
    // Draw the suffix with white color.
    draw_set_color(c_white);
    draw_text(clickable_x + clickable_width, yy, suffix);
    
	
	//draw_rectangle(clickable_x, clickable_y, clickable_x + clickable_width, clickable_y + clickable_height, false);
    // Check for a click on the clickable portion of the text.
    if (to_gamepad_pressed(mb_left))
    {
        // Get the position of the mouse relative to the game window.
        var mouse_x_window = window_mouse_get_x();
        var mouse_y_window = window_mouse_get_y();
        
        // Convert the mouse position to the position relative to the GUI.
        var mouse_x_gui = mouse_x_window;
        var mouse_y_gui = mouse_y_window;
       if (mouse_x_gui >= clickable_x * ratio[0] - clickable_padding && mouse_x_gui < clickable_x * ratio[0] + clickable_width + clickable_padding && mouse_y_gui >= clickable_y * ratio[1] - clickable_padding && mouse_y_gui < clickable_y * ratio[1] + clickable_height + clickable_padding)
        {
			callback(arg);
        }
    }
}


/// function() { show_message("Worked"); }
function GPT_gui_hitbox(xx, yy, width, height, action) {

    // Get the window-relative mouse position
    var mousex = window_mouse_get_x();
    var mousey = window_mouse_get_y();

    // Check if the mouse is within the hitbox area
    if (mousex >= xx && mousex <= xx + width && mousey >= yy && mousey <= yy + height) {
        // Check if the left mouse button is clicked
        if (to_gamepad_pressed(mb_left)) {
            
            // Execute the specified action
            action();
        }
        
        // Debug: Draw a rectangle on the hitbox area
        draw_rectangle(xx, yy, xx + width, yy + height,false);
    } else {
        
        // Debug: Draw a rectangle on the hitbox area
        draw_rectangle(xx, yy, xx + width, yy + height,false);
    }

}
	
	
function gui_image_hitbox(xx, yy, spr, sizew = 1, sizeh = 1) 
{
	var ratio = GPT_window_ratio()
	// Get sprite dimensions and offset
    var spr_w = sprite_get_width(spr) * sizew;
    var spr_h = sprite_get_height(spr) * sizeh;
    var spr_xoffset = sprite_get_xoffset(spr) * sizew;
    var spr_yoffset = sprite_get_yoffset(spr) * sizeh;

    // Calculate hitbox position based on sprite offset
    var hitbox_x = xx - spr_xoffset;
    var hitbox_y = yy - spr_yoffset;

    // Draw sprite on screen
    //draw_sprite(spr, 0, xx, yy);

    // Check if mouse is within hitbox area
    var mousex = window_mouse_get_x();
    var mousey = window_mouse_get_y();

    if (mousex >= hitbox_x*ratio[0] && mousex < (hitbox_x + spr_w)*ratio[0] && mousey >= hitbox_y*ratio[1] && mousey < (hitbox_y + spr_h)*ratio[1]) {
        return true
    }
	else
	{
		return false
	}
}


function GPT_gui_image_hitbox(xx, yy, spr, action) 
{
	// Get sprite dimensions and offset
	var ratio = GPT_window_ratio()
    var spr_w = sprite_get_width(spr);
    var spr_h = sprite_get_height(spr);
    var spr_xoffset = sprite_get_xoffset(spr);
    var spr_yoffset = sprite_get_yoffset(spr);

    // Calculate hitbox position based on sprite offset
    var hitbox_x = xx - spr_xoffset;
    var hitbox_y = yy - spr_yoffset;

    // Draw sprite on screen
    draw_sprite(spr, 0, xx, yy);

    // Check if mouse is within hitbox area
    var mousex = window_mouse_get_x();
    var mousey = window_mouse_get_y();

    if (mousex >= hitbox_x && mousex < hitbox_x + spr_w && mousey >= hitbox_y && mousey < hitbox_y + spr_h) {
        if (to_gamepad_pressed(mb_left)) {
            action();
        }
    }
}

function GPT_gui_image_hitbox_variable(xx, yy, spr, variable = noone, indexer = 0) 
{
	// Get sprite dimensions and offset
    var spr_w = sprite_get_width(spr);
    var spr_h = sprite_get_height(spr);
    var spr_xoffset = sprite_get_xoffset(spr);
    var spr_yoffset = sprite_get_yoffset(spr);

    // Calculate hitbox position based on sprite offset
    var hitbox_x = xx - spr_xoffset;
    var hitbox_y = yy - spr_yoffset;

    // Draw sprite on screen
    draw_sprite(spr, 0, xx, yy);

    // Check if mouse is within hitbox area
    var mousex = window_mouse_get_x();
    var mousey = window_mouse_get_y();

    if (mousex >= hitbox_x && mousex < hitbox_x + spr_w && mousey >= hitbox_y && mousey < hitbox_y + spr_h) {
        if (to_gamepad_pressed(mb_left)) {
            variable = indexer
        }
    }
}

function GPT_gui_image_hitbox_ext(xx, yy, spr, color, scale, rot, alpha, action, hover = c_orange) 
{
	// Get sprite dimensions and offset
	var ratio = GPT_window_ratio()
    var spr_w = sprite_get_width(spr)*scale;
    var spr_h = sprite_get_height(spr)*scale;
    var spr_xoffset = sprite_get_xoffset(spr)*scale;
    var spr_yoffset = sprite_get_yoffset(spr)*scale;

    // Calculate hitbox position based on sprite offset
    var hitbox_x = (xx - spr_xoffset);
    var hitbox_y = (yy - spr_yoffset);

    // Draw sprite on screen
    

    // Check if mouse is within hitbox area
    var mousex = window_mouse_get_x();
    var mousey = window_mouse_get_y();

    if (mousex >= hitbox_x*ratio[0] && mousex < (hitbox_x + spr_w)*ratio[0] && mousey >= hitbox_y*ratio[1] && mousey < (hitbox_y + spr_h)*ratio[1]) {
        draw_sprite_ext(spr, 0, xx, yy, scale, scale, rot, hover, alpha);
	    if (to_gamepad_pressed(mb_left)) {
            action();
        }
    }
	else
	{
		draw_sprite_ext(spr, 0, xx, yy, scale, scale, rot, color, alpha);
	}
}

///GPT_draw_percentage_sprite(prefix, mainVariable, myVariable, x, y)

//prefix: the prefix of the sprite names (e.g. "spr_test_")
//mainVariable: the main variable to compare against
//myVariable: the variable representing a percentage of mainVariable
//x, y: the position to draw the sprite

function GPT_draw_percentage_sprite(prefix, mainVariable, myVariable, x, y)
{
    var percentage = myVariable / mainVariable; //calculate the percentage of myVariable in relation to mainVariable
    var spriteIndex = floor(percentage * 10); //calculate the sprite index based on the percentage

    //Make sure the sprite index is within the range of 0-9
    if (spriteIndex < 0) spriteIndex = 0;
    if (spriteIndex > 9) spriteIndex = 9;

    //Set the sprite to the calculated index
    draw_sprite(spr_test_ + string(spriteIndex), 0, x, y); //replace "spr_test_" with the prefix of your sprite names
}

function GPT_get_arguments(argument_string) {
    var raw_arguments = string_split(argument_string, ",");
    var argumentcount = array_length(raw_arguments);
    var arguments = array_create(argumentcount, undefined);
	
    for (var i = 0; i < argumentcount; i++) {
        var raw_argument = string_trim(raw_arguments[i]);
        if (is_real(raw_argument)) {
            arguments[i] = real(raw_argument);
			
        } else if (is_numeric(raw_argument)) {
            arguments[i] = int64(raw_argument);
			
        } else {
            arguments[i] = raw_argument;
        }
    }
	
    return arguments;
}

/// draw_text_with_title_and_spacing(x, y, title, text, spacing, title_color)

/// Desenha um texto com um título personalizado e um espaçamento entre o título e o texto normal.

/// Argumentos:
/// x - A coordenada x da posição inicial do texto.
/// y - A coordenada y da posição inicial do texto.
/// title - O texto do título que será exibido acima do texto normal.
/// text - O texto normal que será exibido abaixo do título.
/// spacing - O espaçamento em pixels entre o título e o texto normal.
/// title_color - A cor do título.

function draw_text_with_title_and_spacing(_x, _y, title, text, spacing, title_color, font)
{
    var font_size = font_get_size(font);        // obtém o tamanho atual da fonte
    var title_width = string_width(title) + font_size;  // calcula a largura do título em pixels, incluindo o tamanho da fonte
    var text_width = string_width(text);    // calcula a largura do texto normal em pixels

    // Desenha o título com a cor especificada na posição fornecida.
    draw_set_color(title_color);
    draw_text(_x, _y, title);
    // Avança para a posição seguinte à do título com base na largura do título e no espaçamento.
    _x += title_width + spacing;
    // Desenha o texto normal na posição atual com a cor padrão.
    draw_set_color(c_white);
    draw_text(_x, _y, text);
}

function draw_text_with_title(_x, _y, title, text, spacing, title_color, font, text_color = c_white)
{
    var font_size = font_get_size(font);        // obtém o tamanho atual da fonte
    var title_width = string_width(title) + font_size;  // calcula a largura do título em pixels, incluindo o tamanho da fonte
    var text_width = string_width(text);    // calcula a largura do texto normal em pixels

    // Desenha o título com a cor especificada na posição fornecida.
    draw_text_color(_x, _y, title,title_color,title_color,title_color,title_color,1);
    // Define a posição do segundo texto para as variáveis _x2 e _y2.
    _x = _x + spacing;
    // _y = _y2;
    // Desenha o texto normal na posição atual com a cor padrão.
    draw_text_color(_x, _y, text,text_color,text_color,text_color,text_color,1);
}


/// @function rotate_around_object(obj, center_x, center_y, radius, angle)
/// @description Rotates the given object around another object at the specified distance (radius) and angle
/// @param obj The object to rotate
/// @param center_x The x-coordinate of the center of rotation
/// @param center_y The y-coordinate of the center of rotation
/// @param radius The distance from the center of rotation
/// @param angle The angle (in degrees) at which to rotate the object

function rotate_around_object(obj, obj_center_x, obj_center_y, radius, angle) {
	if !variable_instance_exists(obj, "rotation") variable_instance_set(obj, "rotation", 0);
    obj.rotation += angle; // atualiza o ângulo de rotação do objeto

    x = obj_center_x + lengthdir_x(radius, obj.rotation);
    y = obj_center_y + lengthdir_y(radius, obj.rotation);

    obj.x = x;
    obj.y = y;
}

function rotate_around_object_oscillate(obj, center_x, center_y, radius, angle, oscillate)
{
    if (!variable_instance_exists(obj, "rotation"))
        variable_instance_set(obj, "rotation", 0);
    
    if (!variable_instance_exists(obj, "time"))
        variable_instance_set(obj, "time", 0);

    var original_speed = angle;
    var _speed = lerp(original_speed * -1, original_speed, (sin(obj.time) + 1) / 2) * oscillate;
    
    obj.rotation += _speed;
    
    var _x = center_x + lengthdir_x(radius, obj.rotation);
    var _y = center_y + lengthdir_y(radius, obj.rotation);
    
    obj.x = _x;
    obj.y = _y;

    obj.time += 1;
}

function draw_mouse_coordinates()
{
    var _x = window_mouse_get_x();
    var _y = window_mouse_get_y();
    
    draw_text(_x, _y, "Mouse X: " + string(_x) + " Mouse Y: " + string(_y));
}

function draw_sprite_at(sprite, xx, yy, alpha, xscale, yscale, spritename = "")
{
	var spritewidth = 0;
	var spriteheight = 0;
    var spritewidth = sprite_get_width(sprite)*xscale;
    var spriteheight = sprite_get_height(sprite)*yscale;
	
    draw_sprite_pos(sprite, 0, xx, yy, xx + spritewidth, yy, xx + spritewidth, yy + spriteheight, xx, yy + spriteheight, alpha);
	var mousex = window_mouse_get_x();
    var mousey = window_mouse_get_y();
    if (mousex > xx && mousex < xx + spritewidth && mousey > yy && mousey < yy + spriteheight)
    {
        draw_text(mousex + 20, mousey, spritename);
    }
}

function duplicateSpaces(input_string)
{
    var output_string = "";
    for (var i = 1; i <= string_length(input_string); i++)
    {
        var character = string_char_at(input_string, i);
        if (character == " ")
        {
            output_string += "   ";
        }
        else
        {
            output_string += character;
        }
    }
    return output_string;
}

// Create a function to draw a loading bar
// Create a function to draw a centered loading bar with color
function GPT_drawLoadingBar(x, y, actual_value, max_value, bar_color, backgroundcolor)
{
    // Calculate the percentage of actual value compared to max value
    var percentage = actual_value / max_value;
    
    // Set the size of the loading bar
    var bar_width = 20;
    var bar_height = 4;
    
    // Calculate the position of the loading bar to center it
    var bar_x = x - (bar_width / 2);
    var bar_y = y - (bar_height);
    
    // Draw the background
    draw_rectangle_color(bar_x, bar_y, bar_x + bar_width, bar_y + bar_height, backgroundcolor, backgroundcolor, backgroundcolor, backgroundcolor, false);
    
    // Draw the loading bar
    var bar_length = bar_width * percentage;
    draw_rectangle_color(bar_x, bar_y, bar_x + bar_length, bar_y + bar_height, bar_color, bar_color, bar_color, bar_color, false);
}

// função para simular um arremesso com gravidade
// x, y: coordenadas do ponto final
// obj: objeto a ser arremessado
// gravidade: força da gravidade
function GPT_arremessar(xx, yy, obj, gravidade)
{
	obj = instance_create_depth(x,y,depth,obj);
    var x0 = obj.x;  // coordenada inicial em x
    var y0 = obj.y;  // coordenada inicial em y
    var tempoTotal = 60;  // tempo total do movimento (em quadros)
    var v0x = (xx - x0) / tempoTotal;  // velocidade inicial em x
    var v0y = (yy - y0 + (1/2) * gravidade * tempoTotal^2) / tempoTotal;  // velocidade inicial em y
    
    // loop para atualizar a posição do objeto a cada quadro
    for (var t = 0; t < tempoTotal; t++)
    {
        var novoX = x0 + v0x * t;  // nova coordenada em x
        var novoY = y0 + v0y * t - (1/2) * gravidade * t^2;  // nova coordenada em y
        
        obj.x = novoX;
        obj.y = novoY;
    }
}

/// compare_with_margin(input_number, reference_number, margin)
//
//  Compare o número de entrada com o número de referência, permitindo uma margem.
//
//      input_number: o número de entrada a ser comparado.
//      reference_number: o número de referência a ser comparado com o número de entrada.
//      margin: a margem permitida na comparação.
//
//  Returns:
//      true se o número de entrada estiver dentro da margem do número de referência, false caso contrário.

function GPT_compare_with_margin(input_number, reference_number, margin)
{
    var lower_limit = reference_number - margin;
    var upper_limit = reference_number + margin;
    
    if (input_number >= lower_limit && input_number <= upper_limit)
    {
        return true;
    }
    else
    {
        return false;
    }
}

// Função para remover duplicatas em uma array
function remove_duplicates(array)
{
    var length = array_length(array);
    var uniqueArray = [];
    
    for (var i = 0; i < length; i++)
    {
        var element = array[i];
        
        // Verifica se o elemento já existe na uniqueArray
        if (!array_contains(uniqueArray, element))
        {
            // Adiciona o elemento único à uniqueArray
            uniqueArray[array_length(uniqueArray)] = element;
        }
    }
    
    return uniqueArray;
}

// Função auxiliar para verificar se um elemento existe em uma array
function array_contains(array, element)
{
    var length = array_length(array);
    
    for (var i = 0; i < length; i++)
    {
        if (array[i] == element)
        {
            return true;
        }
    }
    
    return false;
}


function GPT_window_ratio(){
	/// Check and get screen ratio
/// Returns an array with the screen ratio for width and height if the window has been resized, otherwise returns [1, 1].

var previousWidth = global.camera.wwidth;
var previousHeight = global.camera.wheight;

var ratioWidth = 1;
var ratioHeight = 1;

var currentWidth = window_get_width();
var currentHeight = window_get_height();

if (currentWidth != previousWidth || currentHeight != previousHeight) {
    ratioWidth = currentWidth / previousWidth;
    ratioHeight = currentHeight / previousHeight;
   if ratioWidth > 1
   {
	   //ratioWidth += 0.01;
	   //ratioHeight += .01;
   }
}

return [ratioWidth, ratioHeight]; // Return [1, 1] if the window has not been resized
}
	

function drawVolumeScrollbar(xx, yy, width, height, minValue, maxValue, currentValue, text = "", x2 = xx, oper = "%", text2 = "") {
    // Desenha a barra de volume
	var _color = c_gray;
	var _padd = 5;
	var _ratio = GPT_window_ratio();
    draw_rectangle_color(xx, yy, xx + width, yy + height, _color, _color, _color, _color, false);
    
    // Calcula a posição do slider
    var sliderWidth = (currentValue - minValue) / (maxValue/_ratio[0] - minValue/_ratio[0]) * (width/_ratio[0] - height/_ratio[1]);///_ratio[0];
    
    // Desenha o slider
    draw_rectangle(xx + sliderWidth, yy -_padd, xx + sliderWidth + height, yy + height + _padd, false);
    
    // Verifica a interação com o mouse
    var mouseX = window_mouse_get_x();
    var mouseY = window_mouse_get_y();
    var isMouseOverSlider = (mouseX >= xx*_ratio[0] && mouseX <= xx*_ratio[0] + width*_ratio[0] && mouseY >= yy*_ratio[1] - _padd && mouseY <= yy*_ratio[1] + height*_ratio[1] + _padd);
    
    if (to_gamepad_click(mb_left)) {
        // Verifica se o mouse está sobre o slider para permitir o movimento
        if (isMouseOverSlider) {
            // Calcula o novo valor com base na posição do mouse
            currentValue = clamp( round((mouseX - xx*_ratio[0]) / (width - height) * (maxValue/_ratio[0] - minValue/_ratio[0]) + minValue/_ratio[0]), minValue, maxValue);
        }
    }
    draw_text_color(x2, yy, text + string(currentValue) + oper, c_orange, c_orange, c_orange, c_orange, 1);
	plus_text_font(x2,yy+30,text2,#E5E5E5,Varnished, fa_left, fa_middle);
	if text2 != "" plus_text_font(x2,yy+38,"______________",#E5E5E5,Varnished, fa_left, fa_middle);
    return currentValue;
}
	
function drawOnOffButton(xx, yy, width, height, text, variable, x2 = xx, y2 = yy, text2 = ""){
	// Desenha a barra de volume
	var _color = c_white;
	var _padd = 5;
	var _ratio = GPT_window_ratio();
	width = width * _ratio[0];
	height = height * _ratio[1];
    //draw_rectangle_color(xx, yy, xx + width, yy + height, _color, _color, _color, _color, false);
    
    // Calcula a posição do slider
    var sliderWidth = 20;
    draw_text_color(xx, yy, text, c_orange, c_orange, c_orange, c_orange, 1);
	plus_text_font(xx,yy+30,text2,#E5E5E5,Varnished, fa_left, fa_middle);
	if text2 != "" plus_text_font(xx,yy+38,"______________",#E5E5E5,Varnished, fa_left, fa_middle);
	
    // Desenha o slider
    if variable == true
	{
		draw_sprite_ext(onoff2,0,x2,y2,1,1,0,_color,1);
		draw_text(x2 + width*1.5 , y2, "[ON]");
	}
	else if variable == false
	{
		draw_sprite_ext(onoff2,0,x2,y2,1,1,0,c_red,1);
		draw_text(x2 + width*1.5 , y2, "[OFF]");
	}
	var mouseX = window_mouse_get_x();
    var mouseY = window_mouse_get_y();
    var isMouseOverSlider = (mouseX >= x2*_ratio[0] && mouseX <= x2*_ratio[0] + width && mouseY >= y2*_ratio[1] - _padd && mouseY <= y2*_ratio[1] + height + _padd);
	
	if (to_gamepad_pressed(mb_left)) {
		
        // Verifica se o mouse está sobre o slider para permitir o movimento
        if (isMouseOverSlider) {
            // Calcula o novo valor com base na posição do mouse
			variable = !variable
        }
    }
	
	return variable
	
}
	
function drawSlider(xx,yy,textinfo, array, indexer, padding = 20){
	if !variable_instance_exists(id, indexer) variable_instance_set(id, indexer, 0);
	var index = variable_instance_get(id,indexer);
	var text = array[index];
	draw_text(xx,yy,textinfo);
	xx = xx + string_width(textinfo) + 50;
	var spacing = 100;
	var size = 100;//string_width(text);
	var mouseX = window_mouse_get_x();
    var mouseY = window_mouse_get_y();
	var _ratio = GPT_window_ratio();
	var mouseLeft = (mouseX >= (xx)*_ratio[0] - padding && mouseX <= xx*_ratio[0] + padding && mouseY >= yy*_ratio[1] && mouseY <= yy*_ratio[1] + padding);
	var mouseRight = (mouseX >= (xx + size)*_ratio[0] - padding && mouseX <= (xx + size)*_ratio[0] + padding && mouseY >= yy*_ratio[1] && mouseY <= yy*_ratio[1] + padding);
	
	if mouseLeft plus_text(xx, yy, "<", c_orange, 0, size, fa_left, fa_top);
	else plus_text(xx, yy, "<", c_white, 0, size, fa_left, fa_top);
	
	plus_text(xx+size/2,yy, text, c_white, 0, size,fa_center, fa_top);
	
	if mouseRight plus_text(xx + size, yy, ">", c_orange, 0, size, fa_left, fa_top);
	else plus_text(xx + size, yy, ">", c_white, 0, size, fa_left, fa_top);
	
	if to_gamepad_pressed(mb_left)
	{
		
		if mouseRight 
		{
			if index < array_length(array)-1 variable_instance_set(id,indexer,index+1);
			else variable_instance_set(id,indexer,0);		
			indexer = 1;
		}	
		if mouseLeft
		{
			if index <= 0 variable_instance_set(id,indexer,array_length(array)-1);
			else index = variable_instance_set(id,indexer,index-1);
			indexer = 0;
		}
	}
	
	return index
}

function drawLanguageSlider(xx,yy,textinfo, array, indexer, padding = 20){
	if !variable_instance_exists(id, indexer) variable_instance_set(id, indexer, 0);
	var index = variable_instance_get(id,indexer);
	var text = array[index];
	draw_text(xx,yy,textinfo);
	xx = xx + string_width(textinfo) + 50;
	var spacing = 100;
	var size = 100;//string_width(text);
	var mouseX = window_mouse_get_x();
    var mouseY = window_mouse_get_y();
	var _ratio = GPT_window_ratio();
	var mouseLeft = (mouseX >= (xx)*_ratio[0] - padding && mouseX <= xx*_ratio[0] + padding && mouseY >= yy*_ratio[1] && mouseY <= yy*_ratio[1] + padding);
	var mouseRight = (mouseX >= (xx + size)*_ratio[0] - padding && mouseX <= (xx + size)*_ratio[0] + padding && mouseY >= yy*_ratio[1] && mouseY <= yy*_ratio[1] + padding);
	
	if mouseLeft plus_text(xx, yy, "<", c_orange, 0, size, fa_left, fa_top);
	else plus_text(xx, yy, "<", c_white, 0, size, fa_left, fa_top);
	
	plus_text(xx+size/2,yy, text, c_white, 0, size,fa_center, fa_top);
	
	if mouseRight plus_text(xx + size, yy, ">", c_orange, 0, size, fa_left, fa_top);
	else plus_text(xx + size, yy, ">", c_white, 0, size, fa_left, fa_top);
	
	if to_gamepad_pressed(mb_left)
	{		
		if mouseRight 
		{
			if index < array_length(array)-1 variable_instance_set(id,indexer,index+1);
			else variable_instance_set(id,indexer,0);		
			indexer = 1;
		}	
		if mouseLeft
		{
			if index <= 0 variable_instance_set(id,indexer,array_length(array)-1);
			else index = variable_instance_set(id,indexer,index-1);
			indexer = 0;
		}
		
		
	}
	//if index == 0 global.lang = "PT"
	//else if index == 1 global.lang = "ES"
	//else global.lang = "EN"
	
	create_language();
	create_materials();
	create_itens_database();
	create_equipments();
	create_player_skills();
	create_skill_database();
	create_triggers();
	create_sound_database();
	create_enemy_database();
	
	return index
}

// Função para verificar se uma tecla foi pressionada duas vezes no intervalo especificado
function keyboard_check_twice(key, interval = 50, count = 2)
{
		var _return = false
		// Verifique se a chave foi pressionada nas duas vezes recentes
		if !variable_instance_exists(id, "_key")
		{
			variable_instance_set(id, "_key", [0, interval])	
		}
		else
		{
			if (keyboard_check_pressed(key))
		    {
				_key[0] += 1;
				if _key[1] > 0
				{
					if _key[0] < count 
					{
						
					}
					else
					{
						_return = true
						_key = [0, 0];
					}
				}
				else
				{
					_key[1] = interval	
				}
		    }
    
	
			if _key[1] > 0 _key[1]--;
			else 
			{
				_key = [0, 0];	
			}
			
	}
	return _return;
}

// Função para verificar se uma tecla foi pressionada duas vezes no intervalo especificado
function mouse_check_twice(key, interval = 50, count = 2)
{
		var _return = false
		// Verifique se a chave foi pressionada nas duas vezes recentes
		if !variable_instance_exists(id, "_key")
		{
			variable_instance_set(id, "_key", [0, interval])	
		}
		else
		{
			if (mouse_check_button_pressed(key))
		    {
				_key[0] += 1;
				if _key[1] > 0
				{
					if _key[0] < count 
					{
						
					}
					else
					{
						_return = true
						_key = [0, 0];
					}
				}
				else
				{
					_key[1] = interval	
				}
		    }
    
	
			if _key[1] > 0 _key[1]--;
			else 
			{
				_key = [0, 0];	
			}
			
	}
	return _return;
}

function mouse_check_multiple(key, interval = 50, count = 2)
{
		
		// Verifique se a chave foi pressionada nas duas vezes recentes
		if !variable_instance_exists(id, "_key")
		{
			variable_instance_set(id, "_key", [0, interval])
			var _return = [false, 0]	
		}
		else
		{
			var _return = [false, _key[0]]	
			if (mouse_check_button_pressed(key))
		    {
				_key[0] += 1;
				if _key[1] > 0
				{	
					if _key[0] < count 
					{
						_return[1] = count;
					}
					else
					{
						_return = [true, count]
						_key = [0, 0];
					}
				}
				else
				{
					_key[1] = interval	
				}
		    }
			else
			{
				var _return = [false, count]	
			}    
	
			if _key[1] > 0 _key[1]--;
			else 
			{
				_key = [0, 0];	
			}
			
	}
	if _key[1] <= 0 	return _return;
}

// Função para verificar se uma tecla foi pressionada duas vezes no intervalo especificado
function mouse_check_once(key)
{
		var _return = [false, 0]
		// Verifique se a chave foi pressionada nas duas vezes recentes
		if !variable_instance_exists(id, "_key")
		{
			variable_instance_set(id, "_key", [0, 50])	
		}
		else
		{
			if (mouse_check_button_pressed(key))
		    {
				if _key[0] <= 0 _return = [true, 1]
				else
				{
					if _key[1] <= 0 _return = [true, 1]
				}
		    }
			
	}
	return _return;
}
    