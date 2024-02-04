// package metadata file for Meteor.js

/* eslint-env meteor */

Package.describe({
  name: 'jgtms:bulma',
  summary: 'Modern CSS framework based on Flexbox',
  version: '0.9.4',
  git: 'https://github.com/jgtms/bulma.git',
})

Package.onUse(api => {
    api.versionFrom('METEOR@1.0')
    api.addFiles([
      'css/bulma.css',
      'css/bulma-rtl.css',
    ], 'client')
})