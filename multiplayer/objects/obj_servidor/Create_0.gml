#macro PORT 13
#macro MAX_CLIENTS 3
//#macro PACKET_KEY 0
#macro PACKET_ENTITY 1
server = network_create_server(network_socket_tcp, PORT, MAX_CLIENTS);
buffer = buffer_create(16384, buffer_grow, 1);
clients = ds_map_create();
sockets = ds_list_create();