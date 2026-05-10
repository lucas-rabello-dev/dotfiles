#!/bin/bash

# -d (verifica se o diretorio existe)
# [] shell test, avalia se verdadeiro ou falso
# -f (verifica se tem um arquivo em comum)
# -r pra copiar o diretorio 'logo/' todo
# -p (se nao existir ele cria, se existir ele nao reclama..)

DIR="$HOME/.config/fastfetch"

mkdir -p "$DIR"

if [ -f "$DIR/config.jsonc" ]; then
    mv "$DIR/config.jsonc" "$DIR/config_old.jsonc"
fi

cp ./config.jsonc "$DIR/"
