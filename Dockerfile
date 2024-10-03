FROM ubuntu:22.04

WORKDIR /ItemStockAPI

COPY ./Linux64/Release/ItemStockAPI ./ItemStockAPI

ENTRYPOINT ./ItemStockAPI