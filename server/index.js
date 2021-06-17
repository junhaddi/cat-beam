const express = require('express');
const app = express();
const database = require('./config');

const leaderboardRef = database.ref('leaderboards');

// 라우팅
app.get('/leaderboards', (req, res) => {
  leaderboardRef.once(
    'value',
    (snapshot) => {
      const data = snapshot.val();
      return res.json(data);
    },
    (errorObject) => {
      console.log('The read failed: ' + errorObject.name);
    }
  );
});

app.post('/leaderboards', (req, res) => {
  const data = { name: req.query.name, score: req.query.score, date: Date.now() };
  leaderboardRef
    .push(data)
    .then(() => {
      console.log(data);
      return res.sendStatus(200);
    })
    .catch((error) => {
      console.log(error);
      return res.sendStatus(500);
    });
});

// Node.js 서버 실행
const start = () => {
  const port = process.env.PORT || 30605;
  app.listen(port, () => {
    console.log(`Server is running on port ${port}`);
  });
};

const main = () => {
  start();
};

main();
