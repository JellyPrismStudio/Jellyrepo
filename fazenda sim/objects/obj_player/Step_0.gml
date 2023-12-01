var w, a, s, d, velh, velv;
w = keyboard_check(ord("W"));
a = keyboard_check(ord("A"));
s = keyboard_check(ord("S"));
d = keyboard_check(ord("D"));
velh = (d-a)*vl;
velv = (s-w)*vl;

vlh = lerp(vlh, velh, .3);
vlv = lerp(vlv, velv, .3);
x += vlh;
y += vlv;