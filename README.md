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

| Host      | Router   | Host IPv6                | Router IPv6               |
|-----------|----------|--------------------------|---------------------------|
| h11 - eth1  | r1       | `fd00:0:11::2/64`        | `fd00:0:11::1/64`         |
| h12 - r1  | r1       | `fd00:0:12::2/64`        | `fd00:0:12::1/64`         |
| h13 - r1  | r1       | `fd00:0:13::2/64`        | `fd00:0:13::1/64`         |
| h31 - r3  | r3       | `fd00:0:31::2/64`        | `fd00:0:31::1/64`         |
| h32 - r3  | r3       | `fd00:0:32::2/64`        | `fd00:0:32::1/64`         |
| h33 - r3  | r3       | `fd00:0:33::2/64`        | `fd00:0:33::1/64`         |
