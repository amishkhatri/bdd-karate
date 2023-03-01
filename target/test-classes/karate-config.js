function configuration() {

       karate.log("Loading karate-config");
       var environment = karate.properties['karate.environment']
       karate.log("Karate environment:" + environment);

       var config = {
            env: environment
       }

       config.baseURL = karate.properties['karate.baseURL'];
       karate.log("Karate baseURL:" + karate.properties['karate.baseURL']);

       karate.configure('connectTimeout', 60000);
       karate.configure('readTimeout', 60000);
       return config;
}
