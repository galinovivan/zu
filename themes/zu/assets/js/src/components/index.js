/**
 * Created by 91178 on 30.09.2017.
 */
import fragment from '../helpers/url';

const url = fragment();

switch (url) {
    case '/welcome':
        require('./welcome/welcome');
        break;
}

