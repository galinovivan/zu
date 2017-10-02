/**
 * Created by 91178 on 30.09.2017.
 */
/**
 * @returns urlFragment {String}
 */
 const fragment = () => {
    return window.location
        .href.toString()
        .split(window.location.host)[1];
};

export default fragment;
