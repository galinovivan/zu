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
 }

export default Storage;