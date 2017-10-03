/**
 * Created by 91178 on 30.09.2017.
 */
import fragment from '../helpers/url';

const url = fragment();
console.log(url);

switch (url) {
    case '/':
        require('./welcome/welcome');
        break;
}

