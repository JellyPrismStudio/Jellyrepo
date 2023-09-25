// * Como aqui estamos usando um método especial só para a rolagem do mouse, não precisa por um main.
// * Caso seja adicionado muito conteudo novo, será necessário

if mouse_zoom > 0.5 mouse_zoom -= zoom_speed;
camera_set_view_size(view_camera[0], view_wport[0]*mouse_zoom, view_hport[0]*mouse_zoom);
camera_set_view_border(view_camera[0],(view_wport[0]*mouse_zoom)/2, (view_hport[0]*mouse_zoom)/2)

global.mouse_zoom = mouse_zoom