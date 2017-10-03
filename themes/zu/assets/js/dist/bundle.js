/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// identity function for calling harmony imports with the correct context
/******/ 	__webpack_require__.i = function(value) { return value; };
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, {
/******/ 				configurable: false,
/******/ 				enumerable: true,
/******/ 				get: getter
/******/ 			});
/******/ 		}
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = 8);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_0__helpers_url__ = __webpack_require__(12);
/**
 * Created by 91178 on 30.09.2017.
 */


const url = __webpack_require__.i(__WEBPACK_IMPORTED_MODULE_0__helpers_url__["a" /* default */])();
console.log(url);

switch (url) {
  case '/':
    __webpack_require__(9);
    break;
}

/***/ }),
/* 1 */
/***/ (function(module, exports) {

/**
 * Created by 91178 on 30.09.2017.
 */

// form.on('change', (e) => {
//     let fileObject = document.getElementById('userAvatar');
//     fileObject = fileObject.files[0];
//     $('body').css('background', `url(http://localhost/${fileObject.name})`)
//     console.log(fileObject.name.relativePath);
// });


const fileInput = $("input[type='file']");
fileInput.on('change', function (e) {
    const label = $(this).siblings(fileInput);
    const fileObject = document.getElementById($(this).attr('id')).files[0];
    label.text(fileObject.name);
});

/***/ }),
/* 2 */
/***/ (function(module, exports) {

(function ($) {

    $(document).ready(function () {

        const navToggle = $('.nav_toggle');
        const menu = $('.menu');
        const close = menu.find('.nav_close');

        navToggle.click(e => {
            menu.toggleClass('open');
        });
        close.click(e => {
            menu.toggleClass('open');
        });
    });
})(jQuery);

/***/ }),
/* 3 */
/***/ (function(module, exports) {

/**
 * Created by master on 04.04.2017.
 */
(function ($) {

    $(window).on('load', function () {
        initPreloader();
    });

    /**
     */
    function initPreloader() {
        const $preloader = $('#pagePreloader'),
              $spinner = $preloader.find('.spinner');

        $spinner.fadeOut('fast');
        $preloader.fadeOut('fast');
    }
})(jQuery);

/***/ }),
/* 4 */
/***/ (function(module, exports) {

(function ($) {
    $(document).ready(function () {

        const changeButton = $('#changeProfile');
        const profileForm = $('.profile_form_hide');
        const profileContainer = $('.profile_container');
        changeButton.click(e => {
            profileForm.show();
            profileContainer.hide();
        });

        const projectUploadMore = $('#projectUploadMore');
        const projectList = $('#profileProjectList');
        const hideProjectForm = $('#profileHideProjectForm');

        projectUploadMore.click(e => {
            projectList.slideToggle('fast');
            hideProjectForm.slideToggle('fast');
        });
    });
})(jQuery);

/***/ }),
/* 5 */
/***/ (function(module, exports) {


$(document).ready(function () {
    $('[data-toggle="tooltip"]').tooltip();
});

/***/ }),
/* 6 */
/***/ (function(module, exports) {

$(document).ready(function () {
    const form = $('.upload_project');
    console.log(form);
    const rButtons = form.find('.multiple_radio');
    const hideInput = form.find('#contributeInput');
    rButtons.click(function (e) {
        console.log(e);
        +$(this).val() === 1 ? hideInput.show() : hideInput.hide();
        console.log(e);
    });
});

/***/ }),
/* 7 */
/***/ (function(module, exports) {

(function ($) {
    const widget = $('.widget');
    const button = widget.find('.action_button');
    const hideInfo = widget.find('.swipe_info');

    button.click(function (e) {
        $(this).siblings('.swipe_info').toggleClass('open');
    });
})(jQuery);

/***/ }),
/* 8 */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
Object.defineProperty(__webpack_exports__, "__esModule", { value: true });
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_0__components__ = __webpack_require__(0);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_1__widget__ = __webpack_require__(7);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_1__widget___default = __webpack_require__.n(__WEBPACK_IMPORTED_MODULE_1__widget__);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_2__tooltip__ = __webpack_require__(5);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_2__tooltip___default = __webpack_require__.n(__WEBPACK_IMPORTED_MODULE_2__tooltip__);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_3__nav__ = __webpack_require__(2);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_3__nav___default = __webpack_require__.n(__WEBPACK_IMPORTED_MODULE_3__nav__);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_4__file_upload__ = __webpack_require__(1);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_4__file_upload___default = __webpack_require__.n(__WEBPACK_IMPORTED_MODULE_4__file_upload__);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_5__profile__ = __webpack_require__(4);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_5__profile___default = __webpack_require__.n(__WEBPACK_IMPORTED_MODULE_5__profile__);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_6__upload_project__ = __webpack_require__(6);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_6__upload_project___default = __webpack_require__.n(__WEBPACK_IMPORTED_MODULE_6__upload_project__);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_7__preloader__ = __webpack_require__(3);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_7__preloader___default = __webpack_require__.n(__WEBPACK_IMPORTED_MODULE_7__preloader__);
















/***/ }),
/* 9 */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
Object.defineProperty(__webpack_exports__, "__esModule", { value: true });
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_0__helpers_cookie__ = __webpack_require__(10);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_1__helpers_storage__ = __webpack_require__(11);



/* harmony default export */ __webpack_exports__["default"] = (new Vue({
    el: '#welcome',
    data: {
        newUser: true,
        step: 1
    },
    created() {
        this.isNewUser();
        if (this.isRegister()) {
            this.step = 3;
            __WEBPACK_IMPORTED_MODULE_1__helpers_storage__["a" /* default */].remove('register');
        }
    },
    methods: {
        toggleClick(step, event) {
            event.preventDefault();
            this.step = step;
            if (step === 2) {
                setTimeout(() => {
                    $('[data-toggle="tooltip"]').tooltip();
                }, 200);
            }
        },
        isNewUser() {
            if (__WEBPACK_IMPORTED_MODULE_0__helpers_cookie__["a" /* default */].get('user_is_visited')) {
                this.newUser = false;
            } else {
                __WEBPACK_IMPORTED_MODULE_0__helpers_cookie__["a" /* default */].set('user_is_visited', 'true', { expires: true });
            }
        },
        isRegister() {
            console.log(__WEBPACK_IMPORTED_MODULE_1__helpers_storage__["a" /* default */].get('register'));
            return __WEBPACK_IMPORTED_MODULE_1__helpers_storage__["a" /* default */].get('register');
        }
    }
}));

/***/ }),
/* 10 */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
class Cookie {
    /**
     * @param name
     * @param value
     * @param options
     */
    static set(name, value, options) {
        options = options || {};

        let expires = options.expiries;

        if (typeof expires === "number" && expires) {
            let d = new Date();
            d.setTime(d.getTime() + expires * 1000);
            expires = options.expiries = d;
        }

        if (expires && expires.toUTCSting) {
            options.expiries = expires.toUTCString();
        }

        value = encodeURIComponent(value);

        let updateCookie = name + "=" + value;

        for (let propName in options) {
            updateCookie += '; ' + propName;
            let propValue = options[propName];

            if (propValue !== true) {
                updateCookie += "=" + propValue;
            }
        }

        document.cookie = updateCookie;
    }

    /**
     * @param name
     * @returns {*}
     */
    static get(name) {
        const matches = document.cookie.match(new RegExp("(?:^|; )" + name.replace(/([\.$?*|{}\(\)\[\]\\\/\+^])/g, '\\$1') + "=([^;]*)"));

        return matches ? decodeURIComponent(matches[1]) : undefined;
    }

    /**
     * @param name
     */
    remove(name) {
        this.set(name, '', { expires: -1 });
    }
}
/* harmony export (immutable) */ __webpack_exports__["a"] = Cookie;


/***/ }),
/* 11 */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
const Storage = {
    repo: window.localStorage || localStorage,
    set(key, value) {
        this.repo.setItem(key, value);
    },
    get(key) {
        return this.repo.getItem(key);
    },
    remove(key) {
        this.repo.removeItem(key);
    }
};

/* harmony default export */ __webpack_exports__["a"] = (Storage);

/***/ }),
/* 12 */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
/**
 * Created by 91178 on 30.09.2017.
 */
/**
 * @returns urlFragment {String}
 */
const fragment = () => {
  return window.location.href.toString().split(window.location.host)[1];
};

/* harmony default export */ __webpack_exports__["a"] = (fragment);

/***/ })
/******/ ]);
//# sourceMappingURL=bundle.js.map