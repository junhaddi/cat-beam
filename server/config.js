const firebase = require('firebase');

var firebaseConfig = {
  apiKey: 'AIzaSyCoamWhAu1vCZ6qmvJ4uLvSA1nSwRYbIBo',
  authDomain: 'cat-beam.firebaseapp.com',
  databaseURL: 'https://cat-beam-default-rtdb.asia-southeast1.firebasedatabase.app',
  projectId: 'cat-beam',
  storageBucket: 'cat-beam.appspot.com',
  messagingSenderId: '924293689820',
  appId: '1:924293689820:web:d85cd96c913655794bdf19',
};

firebase.initializeApp(firebaseConfig);
let database = firebase.database();

module.exports = database;
