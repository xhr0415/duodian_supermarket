module.exports = app => {
    let {addControllerRules} = app.config;

    addControllerRules(app.validator.addRule);
}