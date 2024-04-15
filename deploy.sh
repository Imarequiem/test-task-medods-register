#!/usr/bin/env sh
set -e
# сборка
npm run build
cd dist

# если вы публикуете на пользовательский домен

# echo 'www.example.com' > CNAME

git init git
add -A git
commit -m 'deploy'

# если вы публикуете по адресу https://<USERNAME>.github.io
# git push -f git@github.com:<USERNAME>/<USERNAME>.github.io.git master
git push -f git@github.com:<Imarequiem>/<test-task-medods-register>.git master:gh-pages

cd -