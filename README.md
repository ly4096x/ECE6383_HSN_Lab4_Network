# Network Configuration for NYU ECE6383 Lab4

This configuration enables automatic handling of network creation and management. No need to worry about misconfiguration, this can do everything nice and tidy.

Containers have simple hostnames so that they can be easily identified.

## Prerequisite

- [docker-compose](https://docs.docker.com/compose/install/#install-compose)

## How to start

1. Build the image. Run `docker build -t lab4 .`
2. For task 1, run `CONF=all_cost_10 docker-compose up -d` to create containers and networks. For task 2, replace `all_cost_10` with `modified_cost`.
3. Add routing info for hosts to enable communication.
    - `docker-compose exec h1 ip route add 172.18/16 via 172.18.101.11`
    - `docker-compose exec h2 ip route add 172.18/16 via 172.18.202.12`
4. That's it. All containers and networks are ready to use.

Routers are node `r1` to `r5`, hosts are `h1` and `h2`.

## Meaningful IP addressing

- `172.18.xy.1w`: router `w` on link between router `x` and router `y` (`w` must be `x` or `y`)
  - E.g. `172.18.14.14` means this IP belongs to router 4 on link `r1 <-> r4`
- `172.18.x0y.1w`:  router `w` on link between router/host `x` and router/host `y` (`w` must be `x` or `y` and the other is a host)
  - E.g. `172.18.202.12` means this IP belongs to router 2 on link `r2 <-> h2`
- `172.18.x0y.2w`:  router `w` on link between router/host `x` and router/host `y` (`w` must be `x` or `y` and the other is a router)
  - E.g. `172.18.101.21` means this IP belongs to host 1 on link `h1 <-> r1`

## To run command in container

E.g. `docker-compose exec r1 bash` will start bash shell in node r1.
