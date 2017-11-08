import fragment from './helpers/url';

var url = fragment();

if (url.indexOf('gallery') != -1 || url.indexOf('profile') != -1) {
    require('./text-preview');
}