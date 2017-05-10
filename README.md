Reposado
========

Runs [reposado](https://github.com/wdas/reposado)'s `repo_sync` periodically. By
default it runs every hour, however this can be changed with the `CRON_PATTERN`
variable.

You should also make sure /data/html and /data/metadata is persistent.

## Web server

The `latest` tag only contains reposado and handles running it at the at the
specified time, the web server should run in a different container. A
preconfigured nginx image is available at `erlend/reposado:nginx`, but you can
of course use any web server (just point it to the `/data/html` path).

## Example

```
docker run -d --name=reposado -v /data:/path/to/local/data erlend/reposado
# Optional web server
docker run -d --name=reposado-web --volumes-from=reposado erlend/reposado:nginx
```

## Configuration

| Variable       | Description                   | Default value |
| -------------- | ----------------------------- | ------------- |
| `CRON_PATTERN` | when to run repo_sync         | `13 * * * *`) |
| `USER_ID`      | the uid of the reposado user  | `1000`        |
| `GROUP_ID`     | the gid of the reposado group | `1000`        |
