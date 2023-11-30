var hsped, vsped;
hsped = (keys[KEY_RIGHT]-keys[KEY_LEFT])*vl;
vsped = (keys[KEY_DOWN]-keys[KEY_UP])*vl;
vlh = lerp(vlh, hsped, .3);
vlv = lerp(vlv, vsped, .3);

x += vlh;
y += vlv;