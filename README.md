# pruebas

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
Ejemplo 2 h11-h51 pasando por 7 y 6, primero en r1:
```
ip -6 route add fd00:0:51::/64 encap seg6 mode encap segs fcff:7::1,fcff:6::1,fcff:5::1 dev eth2
```
Posteriormente en **r5**:
```
ip -6 route add fd00:0:11::/64 encap seg6 mode encap segs fcff:6::1,fcff:7::1,fcff:1::1 dev eth4
```
