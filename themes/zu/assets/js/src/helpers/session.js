const SessionStorage = {
    storage: sessionStorage || window.sessionStorage,
    set(key, value) {
        this.storage.setItem(key, value);
    },
    get(key) {
        return this.storage.getItem(key);
    },
    remove(key) {
        this.storage.removeItem(key);
    }
};


export default SessionStorage;