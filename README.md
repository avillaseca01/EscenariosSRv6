# pruebas

Para poder ejecutar algunos escenarios es necesario, añadir al fichero **/etc/sysctl.conf**:

```
fs.file-max = 4194304 <br>
fs.inotify.max_queued_events = 2097152 <br>
fs.inotify.max_user_instances = 2097152 <br>
fs.inotify.max_user_watches = 2097152 <br>
```

Y finalmente reiniciar o ejecutar **sysctl --system** para que se apliquen estos cambios
