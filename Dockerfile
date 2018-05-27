FROM elixir:1.6.5 as builder
COPY . /app
WORKDIR /app
ENV MIX_ENV prod
RUN cd /app && \ 
    mix local.hex --force && \
    mix local.rebar --force && \
    mix release

FROM elixir:1.6.5
COPY --from=builder /app/_build/prod/rel/testing/. /app/.
WORKDIR /app
CMD ["/app/bin/testing", "foreground"]
 