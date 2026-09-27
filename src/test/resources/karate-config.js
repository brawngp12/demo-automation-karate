/**
 * karate-config.js
 *
 * Global configuration for all Karate tests.
 * This file is automatically loaded before each feature file runs.
 *
 * Set the environment via Maven:  mvn test -Dkarate.env=staging
 * Default environment is 'dev' if not specified.
 */
function fn() {

    // Read active environment (default: 'dev')
    var env = karate.env || 'dev';
    karate.log('Active environment:', env);

    // Base config shared across all environments
    var config = {
        env: env,
        connectTimeout: 5000,
        readTimeout: 10000,
        iphone16Driver: {
            type: 'chrome',
            executable: 'C:/Users/ASUS/AppData/Local/Google/Chrome/Application/chrome.exe',
            addArgs: [
                '--window-size=393,852',
                '--user-agent=Mozilla/5.0 (iPhone; CPU iPhone OS 18_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.0 Mobile/15E148 Safari/604.1'
            ]
        }
    };

    // Environment-specific overrides
    if (env === 'dev') {
        config.baseUrl = 'https://iboard-query.ssi.com.vn';
    } else if (env === 'staging') {
        config.baseUrl = 'https://staging.your-api.com';
    } else if (env === 'prod') {
        config.baseUrl = 'https://api.your-api.com';
    }

    // Apply global HTTP settings
    karate.configure('connectTimeout', config.connectTimeout);
    karate.configure('readTimeout', config.readTimeout);

    config.myGlobalHeaders = {
        'Content-Type': 'application/json',
        'Accept': 'application/json, text/plain, */*',
        'device-id': '4CFC3788-129C-4E07-902B-678C90074240',
        'accept-language':'en',
        'user-agent':'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36'
    };

    return config;

}
