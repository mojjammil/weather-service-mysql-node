var mysql = require('mysql');
const connection = createDatabaseConnection();
testFunction();

function testFunction(){
    connection.connect();
      // selectSpecificSensorData(1).then(results => {
      //   console.log(results);
      // });
      // selectSpecificSensorData(2).then(results =>{
      //   console.log(results);
      // }); 
      // selectSpecificSensorData(3).then(results =>{
      //   console.log(results);
      //   connection.end();
      // }); //Should print "no entries yet"

      // getAllSensorData().then(results => {
      //   console.log(results);
      // });//Should print all data

    // addSensors("sensor5").then(results => {
    //   console.log(results);
    // }); //Should add sensor5 in sensors table

    // addStations("station5").then(results=>{
    //   console.log(results);
    // })

    // let data = {
    //   "sensor_ID": 78,
    //   "measurement": 25
    // };
    // insertSensorData(data).then(results => {
    //   console.log(results);
    // });
    
    // updateState("off", "station3").then(results => {
    //   console.log(results);
    // });

    // updateState("on", "station3").then(results => {
    //   console.log(results);
    // });

    // updateState("error", 1).then(results => {
    //   console.log(results);
    // });
    

      console.log("hello");
};

// Get sensor data by location
function dataByLocation(gps) {
  let sql = `INSERT INTO sensors (sensor_name) VALUES ("${sensorName}")`;
  return new Promise( (resolve, reject) => {
    connection.query(sql, (error, results) =>{
      if(error) reject(error)
      else if (results.length === 0) resolve("No records found")
      else {
        console.log("Number of sensors added: " + results.affectedRows);
      }
    });
  });
};

// 1. Will add new stations and sensors to the database
function addSensors(sensorName) {
  let sql = `INSERT INTO sensors (sensor_name) VALUES ("${sensorName}")`;
  return new Promise( (resolve, reject) => {
    connection.query(sql, (error, results) =>{
      if(error) reject(error)
      else if (results.length === 0) resolve("No records found")
      else {
        console.log("Number of sensors added: " + results.affectedRows);
      }
    });
  });
};

function addStations(stationName) {
  let sql = `INSERT INTO stations (station_name) VALUES ("${stationName}")`;
  return new Promise( (resolve, reject) => {
    connection.query(sql, (error, results) =>{
      if(error) reject(error)
      else if (results.length === 0) resolve("No records found")
      else {
        console.log("Number of stations added: " + results.affectedRows);
      }
    });
  });
};

// 2. Add sensor data to database when new data pulse is received
function insertSensorData(data) {
  let sql = `INSERT INTO sensor_data(sensor_ID, measurement) VALUES (${data.sensor_ID}, ${data.measurement})`;
  return new Promise( (resolve, reject) => {
    connection.query(sql, (error, results) =>{
      if(error) reject(error)
      else {
        resolve("Number of rows added: " + results.affectedRows);
      }
    });
  });
};

// 3. Change the status of a station to either error, off, or on
function updateState(status, stationID) {
  let sql = `UPDATE stations SET state = "${status}" WHERE station_ID = ${stationID}`; 
  return new Promise( (resolve, reject) => {
    connection.query(sql, (error, results) =>{
      if(error) reject(error)
      else {
        resolve("Number of updates: " + results.affectedRows);
      }
    });
  });
};

// 4. Get all data
function getAllSensorData() {
  let sql = `SELECT * FROM sensor_data`;

  return new Promise( (resolve, reject) => {
    connection.query(sql, (error, results) =>{
      if(error) reject(error)
      else if (results.length === 0) resolve("No records found")
      else {
        resolve(JSON.stringify(results));
      }
    });
  });
};
// 5. Get Specific sensor data
function selectSpecificSensorData(sensor_ID){
    let sql = `SELECT measurement FROM sensor_data WHERE sensor_ID = ${sensor_ID}`

    return new Promise( (resolve, reject) => {
      connection.query(sql, (error, results) =>{
        if(error) reject(error);
        else if (results.length === 0) resolve("No records found")
        else {
          resolve(JSON.stringify(results));
        }
      });
    });
};

function createDatabaseConnection(){

  var connection = mysql.createConnection({
    host     : 'localhost',
    user     : 'weather_station_manager', //Your user details here
    password : 'cat123',
    database : 'weatherservice'
  });

  return connection;
};