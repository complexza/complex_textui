fx_version 'cerulean'
game "gta5"
author "complexza"
version '1.0.0'
description 'Text UI for FiveM Inspired by NP 4.0'
repository 'https://github.com/complexza/complex-text-ui'

lua54 'yes'

ui_page 'web/build/index.html'
-- ui_page 'http://localhost:3000/' --for dev

shared_script {
    'shared/**'
}

client_script {
    'client/**',
}

files {
    'web/build/**',
}
