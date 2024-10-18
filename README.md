# Escenarios SRv6

Para poder ejecutar algunos escenarios es necesario, añadir al fichero **/etc/sysctl.conf**:

```
fs.file-max = 4194304
fs.inotify.max_queued_events = 2097152
fs.inotify.max_user_instances = 2097152
fs.inotify.max_user_watches = 2097152
```

Y finalmente reiniciar o ejecutar **sysctl --system** para que se apliquen estos cambios

Para probar el escenario con SRv6, es necesario añadir entre los routers finales los siguientes comandos, por ejemplo para establecer **conexión entre h11 y h81, pasando por r4**, primero en **r1**:
```
ip -6 route add fd00:0:81::/64 encap seg6 mode encap segs fcff:4::1,fcff:8::1 dev eth2
```
Posteriormente en **r8**:
```
ip -6 route add fd00:0:11::/64 encap seg6 mode encap segs fcff:4::1,fcff:1::1 dev eth3
```
## Direciones IPv6

| Host        | Router   | Host IPv6                | Router IPv6               |
|-------------|----------|--------------------------|---------------------------|
| h11 - eth1  | r1       | `fd00:0:11::2/64`        | `fd00:0:11::1/64`         |
| h31 - eth1  | r3       | `fd00:0:31::2/64`        | `fd00:0:31::1/64`         |
| h51 - eth1  | r5       | `fd00:0:51::2/64`        | `fd00:0:51::1/64`         |
| h81 - eth1  | r8       | `fd00:0:81::2/64`        | `fd00:0:81::1/64`         |


## Acknowledgements

This project drew inspiration from [rose-srv6-tutorial](https://github.com/netgroup/rose-srv6-tutorial.git)
