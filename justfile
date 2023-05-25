set shell := ["bash", "-uc"]
set dotenv-load

build:
    hugo --gc --minify

update-theme:
    hugo mod get -u

dev-server:
    hugo server --minify -D

new-note title:
    #!/usr/bin/bash
    filename=$(echo "{{title}}" | tr '[:upper:]' '[:lower:]' | tr ' ' '-')
    echo $filename
    cd ./content/notes && touch "${filename}.md"
    cat << EOF > "./${filename}.md"
    ---
    title: {{title}}
    date: "$(date -I)"
    categories:
      - ...
    tags:
      - ...
    toc: true
    math: false
    ---
    EOF
