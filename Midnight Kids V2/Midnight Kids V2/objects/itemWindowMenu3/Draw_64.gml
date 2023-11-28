if live_call() return live_result;

mx = object_viewport.x;
my = object_viewport.y;

gcw = global.config.camera_width;
gch = global.config.camera_height;

draw_set_font(DayDream_pt11);

draw_set_valign(fa_top);
draw_set_halign(fa_center);
draw_text(global.camera.width - 220,global.camera.height/1.1 - 155 + yyfix,"Inventory");
draw_text(global.camera.width + 210,global.camera.height/1.1 - 155 + yyfix,"Description");

draw_set_font(Ruler);
draw_text(global.config.camera_width - 210,global.config.camera_height+130,string(page) +"/"+string(page_max));
draw_set_halign(fa_left);

