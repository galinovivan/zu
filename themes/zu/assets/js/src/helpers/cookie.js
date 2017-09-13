export default class Cookie {
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
        const matches = document.cookie.match(new RegExp(
            "(?:^|; )" + name.replace(/([\.$?*|{}\(\)\[\]\\\/\+^])/g, '\\$1') + "=([^;]*)"
        ));

        return matches ? decodeURIComponent(matches[1]) : undefined;
    }

    /**
     * @param name
     */
    remove(name) {
        this.set(name, '', {expires: -1});
    }
}